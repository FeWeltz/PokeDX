import { LightningElement, api } from "lwc";
export default class pokeCard extends LightningElement {
  @api pokemon;

  handleViewPokeId() {
    const selectEvent = new CustomEvent("pokemonview", {
      detail: this.pokemon.Id
    });
    this.dispatchEvent(selectEvent);
  }
}