//creo la clase batch 
global class AbilityBatch implements Database.Batchable<Integer>, Database.AllowsCallouts, Database.Stateful {
    //Creo la list con el constructor
    Public List<Integer> counter;
    Public AbilityBatch(List<Integer> counter){
        this.counter = counter;
    }
    global List<Integer> start(Database.BatchableContext bc){
        return counter;
    }
    global void execute(Database.BatchableContext bc, List<Integer> scope){

        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://pokeapi.co/api/v2/ability/' + scope[0]);
        req.setMethod('GET');
        HttpResponse res = http.send(req);
        System.debug(res.getBody());
        AbilityJSON AbiliJson = AbilityJSON.parse(res.getBody());
        Habilidad__c Ability = new Habilidad__c();
        if(res.getStatusCode() == 200){
            map<string,object> result = (map<string,object>) json.deserializeuntyped(res.getBody());
            
            Ability.Name = AbiliJson.name;
            Ability.ExtId__c = AbiliJson.id;
            
            if (AbiliJson.id <= 191 && AbiliJson.effect_entries.size() > 0) {

                Ability.Efecto__c = AbiliJson.effect_entries[1].short_effect;

                } else  if (AbiliJson.id > 191 && AbiliJson.effect_entries.size() > 0){

                    Ability.Efecto__c = AbiliJson.effect_entries[0].short_effect;

                } else if(AbiliJson.effect_entries == null) {

                    Ability.Efecto__c = '-';
                
            }
        
            insert Ability;

        } else {
            
            System.debug('error');
        }
    }
    
    global void finish(Database.BatchableContext bc){
        System.debug('Termino el Batch');
        
    }
}
/* List<Habilidad__c> borrar = [SELECT Id FROM Habilidad__c];
    delete borrar; */
 
/*list<integer> abtys = new list<integer>();
for (integer i = 1 ; i <= 267 ; i++){
    abtys.add(i);
}
AbilityBatch batch = new AbilityBatch(abtys);
database.executeBatch(batch, 1);*/