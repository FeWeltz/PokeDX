global class MoveBatch implements Database.Batchable<Integer>, Database.AllowsCallouts, Database.Stateful {
    //Creo la list con el constructor
    Public List<Integer> counter;
    Public MoveBatch(List<Integer> counter){
        this.counter = counter;
    }
    global List<Integer> start(Database.BatchableContext bc){
        return counter;
    }
    global void execute(Database.BatchableContext bc, List<Integer> scope){

        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://pokeapi.co/api/v2/move/' + scope[0]);
        req.setMethod('GET');
        HttpResponse res = http.send(req);
        System.debug(res.getBody());
        MoveJSON MoveJson = MoveJSON.parse(res.getBody());
        Movimiento__c Moves = new Movimiento__c();
        if(res.getStatusCode() == 200){

            map<string,object> result = (map<string,object>) json.deserializeuntyped(res.getBody());
            
            Moves.Name = MoveJson.name;
            Moves.ExtId__c = MoveJson.id;       
            Moves.Chance_de_Efecto__c = MoveJson.effect_chance;
            Moves.Prioridad__c = MoveJson.priority;
            Moves.Punteria__c = MoveJson.accuracy;
            Moves.Poder__c = MoveJson.power;
            Moves.Pp__c = MoveJson.pp;      
            Moves.Tipo__c = MoveJson.type.name;
            Moves.Objetivo__c = MoveJson.target.name;

            if(MoveJson.effect_entries.size() > 0){

                Moves.Efecto__c = MoveJson.effect_entries[0].short_effect;

                } else if(MoveJson.effect_entries == null){

                    Moves.Efecto__c = '-' ;
            }

            
            insert Moves;

        }
        else {
            System.debug('error');
        }
    }
    
    global void finish(Database.BatchableContext bc){
        System.debug('Termino el Batch');
        
    }
}

 /* List<Movimiento__c> borrar = [SELECT Id FROM Movimiento__c];
    delete borrar; */

/*list<integer> Moves = new list<integer>();
for (integer i = 1 ; i <= 826 ; i++){
    Moves.add(i);
}
MoveBatch batch = new MoveBatch(Moves);
database.executeBatch(batch, 1);*/