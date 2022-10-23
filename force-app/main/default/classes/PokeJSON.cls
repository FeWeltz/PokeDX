public class PokeJSON{
	public cls_abilities[] abilities;
	public Integer base_experience;	//101
	public cls_forms[] forms;
	public cls_game_indices[] game_indices;
	public Integer height;	//3
	public cls_held_items[] held_items;
	public Integer id;	//132
	public boolean is_default;
	public String location_area_encounters;	//https://pokeapi.co/api/v2/pokemon/132/encounters
	public cls_moves[] moves;
	public String name;	//ditto
	public Integer order;	//214
	public cls_past_types[] past_types;
	public cls_species species;
	public cls_sprites sprites;
	public cls_stats[] stats;
	public cls_types[] types;
	public Integer weight;	//40
	public class cls_abilities {
		public cls_ability ability;
		public boolean is_hidden;
		public Integer slot;	//1
	}
	public class cls_ability {
		public String name;	//limber
		public String url;	//https://pokeapi.co/api/v2/ability/7/
	}
	public class cls_forms {
		public String name;	//ditto
		public String url;	//https://pokeapi.co/api/v2/pokemon-form/132/
	}
	public class cls_game_indices {
		public Integer game_index;	//76
		public cls_version version;
	}
	public class cls_version {
		public String name;	//ruby
		public String url;	//https://pokeapi.co/api/v2/version/7/
	}
	public class cls_held_items {
		public cls_item item;
		public cls_version_details[] version_details;
	}
	public class cls_item {
		public String name;	//metal-powder
		public String url;	//https://pokeapi.co/api/v2/item/234/
	}
	public class cls_version_details {
		public Integer rarity;	//5
		public cls_version version;
	}
	public class cls_moves {
		public cls_move move;
		public cls_version_group_details[] version_group_details;
	}
	public class cls_move {
		public String name;	//transform
		public String url;	//https://pokeapi.co/api/v2/move/144/
	}
	public class cls_version_group_details {
		public Integer level_learned_at;	//1
		public cls_move_learn_method move_learn_method;
		public cls_version_group version_group;
	}
	public class cls_move_learn_method {
		public String name;	//level-up
		public String url;	//https://pokeapi.co/api/v2/move-learn-method/1/
	}
	public class cls_version_group {
		public String name;	//red-blue
		public String url;	//https://pokeapi.co/api/v2/version-group/1/
	}
	public class cls_past_types {
	}
	public class cls_species {
		public String name;	//ditto
		public String url;	//https://pokeapi.co/api/v2/pokemon-species/132/
	}
	public class cls_sprites {
		public String back_default;	//https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/132.png
		public String back_female;
		public String back_shiny;	//https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/shiny/132.png
		public String back_shiny_female;
		public String front_default;	//https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/132.png
		public String front_female;
		public String front_shiny;	//https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/132.png
		public String front_shiny_female;
	}
	public class cls_back_female {
	}
	public class cls_back_shiny_female {
	}
	public class cls_front_female {
	}
	public class cls_front_shiny_female {
	}
	public class cls_stats {
		public Integer base_stat;	//48
		public Integer effort;	//1
		public cls_stat stat;
	}
	public class cls_stat {
		public String name;	//hp
		public String url;	//https://pokeapi.co/api/v2/stat/1/
	}
	public class cls_types {
		public Integer slot;	//1
		public cls_type type;
	}
	public class cls_type {
		public String name;	//normal
		public String url;	//https://pokeapi.co/api/v2/type/1/
	}
	public static PokeJSON parse(String json){
		return (PokeJSON) System.JSON.deserialize(json, PokeJSON.class);
	}
}