global class PokeBatch implements Database.Batchable<Integer>, Database.AllowsCallouts, Database.Stateful {
    // Creo la list con el constructor
    Public List<Integer> counter;
    Public PokeBatch(List<Integer> counter){
        this.counter = counter;
    }
    global List<Integer> start(Database.BatchableContext bc){
        return counter;
    }
    global void execute(Database.BatchableContext bc, List<Integer> scope){

        try {
            

        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://pokeapi.co/api/v2/pokemon/' + scope[0]);
        req.setMethod('GET');
        HttpResponse res = http.send(req);
        PokeJSON PokeJson = PokeJSON.parse(res.getBody());
        Pokemon__c Poke = new Pokemon__c();
        if(res.getStatusCode() == 200){
            map<string,object> result = (map<string,object>) json.deserializeuntyped(res.getBody());
                Poke.Name = PokeJson.name;
                Poke.ExtId__c = PokeJson.id; 
                Poke.Altura__c = PokeJson.height;
                Poke.Peso__c = PokeJson.weight;
                Poke.Imagen__c = PokeJson.sprites.front_default;
                Poke.Numero_de_Pokemon__c = PokeJson.order;
                Poke.Vida__c = PokeJson.stats[0].base_stat;
                Poke.Ataque__c = PokeJson.stats[1].base_stat;
                Poke.Defensa__c = PokeJson.stats[2].base_stat;
                Poke.Velocidad__c = PokeJson.stats[5].base_stat;
                Poke.Habilidad__c = [SELECT Id,Name FROM Habilidad__c WHERE Name = :PokeJson.abilities[0].ability.name].id;

                if(PokeJson.moves.size() == 1){
                        Poke.Slot1__c = [SELECT Id,Name FROM Movimiento__c WHERE Name = :PokeJson.moves[0].move.name].id;
                    } else if(PokeJson.moves.size() == 2){
                        Poke.Slot1__c = [SELECT Id,Name FROM Movimiento__c WHERE Name = :PokeJson.moves[0].move.name].id;
                        Poke.Slot2__c = [SELECT Id,Name FROM Movimiento__c WHERE Name = :PokeJson.moves[1].move.name].id;
                    } else if(PokeJson.moves.size() >= 4){
                        Poke.Slot1__c = [SELECT Id,Name FROM Movimiento__c WHERE Name = :PokeJson.moves[0].move.name].id;
                        Poke.Slot2__c = [SELECT Id,Name FROM Movimiento__c WHERE Name = :PokeJson.moves[1].move.name].id;
                        Poke.Slot3__c = [SELECT Id,Name FROM Movimiento__c WHERE Name = :PokeJson.moves[2].move.name].id;
                        Poke.Slot4__c = [SELECT Id,Name FROM Movimiento__c WHERE Name = :PokeJson.moves[3].move.name].id;
                }
            
                //Tipos
                if(PokeJson.types.size() == 2){

                        Poke.Tipos__c = PokeJson.types[0].type.name + ';' + PokeJson.types[1].type.name;

                    } else if(PokeJson.types.size() == 1) {

                        Poke.Tipos__c = PokeJson.types[0].type.name;
                }
              
            
            insert Poke;

        }
        else {
            System.debug('error');
        }
    } catch (Exception e) {
            System.debug('error :' + e);
    }

    }
    
    global void finish(Database.BatchableContext bc){
        System.debug('Termino el Batch');
        
    }
}
/* List<Pokemon__c> borrar = [SELECT Id FROM Pokemon__c];
    delete borrar; */

/*list<integer> Pokes = new list<integer>();
for (integer i = 1 ; i <= 898 ; i++){
    Pokes.add(i);
}
PokeBatch batch = new PokeBatch(Pokes);
database.executeBatch(batch, 1);*/