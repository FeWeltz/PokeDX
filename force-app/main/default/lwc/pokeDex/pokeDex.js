import { NavigationMixin } from "lightning/navigation";
import { LightningElement, wire } from "lwc";
import searchPokemons from "@salesforce/apex/PokeDexController.searchPokemons";
export default class pokeDex extends NavigationMixin(LightningElement) {
  tipo = "Todos";
  generacion = "0";
  searchTerm = "";
  @wire(searchPokemons, {
    tipo: "$tipo",
    generacion: "$generacion",
    searchTerm: "$searchTerm"
  })
  pokemons;

  
  get tipos() {
    return [
      { label: "Todos", value: "Todos" },
      { label: "Normal", value: "Normal" },
      { label: "Fighting", value: "Fighting" },
      { label: "Flying", value: "Flying" },
      { label: "Poison", value: "Poison" },
      { label: "Ground", value: "Ground" },
      { label: "Bug", value: "Bug" },
      { label: "Ghost", value: "Ghost" },
      { label: "Steel", value: "Steel" },
      { label: "Fire", value: "Fire" },
      { label: "Water", value: "Water" },
      { label: "Grass", value: "Grass" },
      { label: "Electric", value: "Electric" },
      { label: "Psychic", value: "Psychic" },
      { label: "Ice", value: "Ice" },
      { label: "Dragon", value: "Dragon" },
      { label: "Dark", value: "Dark" },
      { label: "Fairy", value: "Fairy" },
      { label: "Rock", value: "Rock" }
    ];
  }

  get generaciones() {
    return [
      { label: "Todos", value: "0" },
      { label: "Primera", value: "1" },
      { label: "Segunda", value: "2" },
      { label: "Tercera", value: "3" },
      { label: "Cuarta", value: "4" },
      { label: "Quinta", value: "5" },
      { label: "Sexta", value: "6" },
      { label: "Septima", value: "7" },
      { label: "Octava", value: "8" }
    ];
  }

  handleInputSearch(event) {
    const searchTerm = event.target.value;
      this.searchTerm = searchTerm;
  }

  handleFilterGen(event) {
    const generacion = event.target.value;
      this.generacion = generacion;
  }

  handleFilterType(event) {
    const tipo = event.target.value;
      this.tipo = tipo;
  }

  get hasResults() {
    console.log(this.pokemons);
    return this.pokemons.data.length > 0;
  }

  handlePokeDetail(event) {
    const pokemonId = event.detail;
    this[NavigationMixin.Navigate]({
      type: "standard__recordPage",
      attributes: {
        recordId: pokemonId,
        objectApiName: "Pokemon__c",
        actionName: "view"
      }
    });
  }
}