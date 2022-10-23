public class AbilityJSON{
	public cls_effect_entries[] effect_entries;
	public Integer id;	//1
	public String name;	//stench
	public cls_names[] names;
	public cls_pokemon[] pokemon;
	public class cls_effect_changes {
		public cls_effect_entries[] effect_entries;
		public cls_version_group version_group;
	}
	public class cls_effect_entries {
		public String effect;	//Attacken die Schaden verursachen haben mit jedem Treffer eine 10% Chance das Ziel zurückschrecken zu lassen, wenn die Attacke dies nicht bereits als Nebeneffekt hat.
        //Der Effekt stapelt nicht mit dem von getragenen Items.Außerhalb vom Kampf: Wenn ein Pokémon mit dieser Fähigkeit an erster Stelle im Team steht, tauchen wilde Pokémon nur halb so oft auf.
		public cls_language language;
		public String short_effect;	//Mit jedem Treffer besteht eine 10% Chance das Ziel zurückschrecken zu lassen.
	}
	public class cls_language {
		public String name;	//ja-Hrkt
		public String url;	//https://pokeapi.co/api/v2/language/1/
	}
	public class cls_version_group {
		public String name;	//ruby-sapphire
		public String url;	//https://pokeapi.co/api/v2/version-group/5/
	}
	public class cls_flavor_text_entries {
		public String flavor_text;	//Helps repel wild POKéMON.
		public cls_language language;
		public cls_version_group version_group;
	}
	public class cls_generation {
		public String name;	//generation-iii
		public String url;	//https://pokeapi.co/api/v2/generation/3/
	}
	public class cls_names {
		public cls_language language;
		public String name;	//あくしゅう
	}
	public class cls_pokemon {
		public cls_pokemon pokemon;
		public String name;	//gloom
		public String url;	//https://pokeapi.co/api/v2/pokemon/44/
		public Integer slot;	//3
	}
	public static AbilityJSON parse(String json){
		return (AbilityJSON) System.JSON.deserialize(json, AbilityJSON.class);
	}

}