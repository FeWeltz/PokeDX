public with sharing class PokeDexController {
    @AuraEnabled(Cacheable=true)
    public static Pokemon__c[] getAllPokemons() {
      return [
            SELECT
            Id,
            ExtId__c,
            Name,
            Altura__c,
            Peso__c,
            Tipos__c,
            Imagen__c,
            Generacion__c,
            Numero_de_Pokemon__c
        FROM Pokemon__c
        ORDER BY ExtId__c
      ];
    }
  
    @AuraEnabled(Cacheable=true)
    public static Pokemon__c[] searchPokemons(
      String tipo,
      Integer generacion,
      String searchTerm
    ) {
      // Return all pokemons when no search term
      searchTerm = searchTerm.trim();
  
      searchTerm = '%' + searchTerm + '%';
  
      String query = 'SELECT Id,ExtId__c,Name,Tipos__c,Altura__c,Peso__c, Generacion__c,Imagen__c,Numero_de_Pokemon__c FROM Pokemon__c';
  
      if (searchTerm != '') {
        query += ' WHERE Name LIKE :searchTerm ';
      }
      if (tipo != 'Todos') {
        query += ' AND Tipos__c INCLUDES(:tipo) ';
      }
      if (generacion != 0) {
        query += ' AND Generacion__c =:generacion ';
      }
      query += ' ORDER BY ExtId__c';
  
      return Database.query(query);
    }
  }