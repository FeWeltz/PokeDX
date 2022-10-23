public class MoveJSON{
	public Integer accuracy;	//100
	public cls_contest_combos contest_combos;
	public cls_contest_effect contest_effect;
	public cls_contest_type contest_type;
	public cls_damage_class damage_class;
	public Integer effect_chance;	//10
	public cls_effect_changes[] effect_changes;
	public cls_effect_entries[] effect_entries;
	public cls_flavor_text_entries[] flavor_text_entries;
	public cls_generation generation;
	public Integer id;	//8
	public cls_learned_by_pokemon[] learned_by_pokemon;
	public cls_machines[] machines;
	public String name;	//ice-punch
	public cls_names[] names;
	public cls_past_values[] past_values;
	public Integer power;	//75
	public Integer pp;	//15
	public Integer priority;	//0
	public cls_stat_changes[] stat_changes;
	public cls_super_contest_effect super_contest_effect;
	public cls_target target;
	public cls_type type;
	public class cls_contest_combos {
		public cls_normal normal;
		//public cls_super super;
	}
	public class cls_normal {
		public cls_use_after[] use_after;
		public cls_use_before[] use_before;
	}
	public class cls_use_after {
	}
	public class cls_use_before {
	}
	public class cls_super {
		public cls_use_after use_after;
		public cls_use_before use_before;
	}
	public class cls_contest_effect {
		public String url;	//https://pokeapi.co/api/v2/contest-effect/1/
	}
	public class cls_contest_type {
		public String name;	//beauty
		public String url;	//https://pokeapi.co/api/v2/contest-type/2/
	}
	public class cls_damage_class {
		public String name;	//physical
		public String url;	//https://pokeapi.co/api/v2/move-damage-class/2/
	}
	public class cls_effect_changes {
	}
	public class cls_effect_entries {
		public String effect;	//Inflicts regular damage.  Has a $effect_chance% chance to freeze the target.
		public cls_language language;
		public String short_effect;	//Has a $effect_chance% chance to freeze the target.
	}
	public class cls_language {
		public String name;	//ja-Hrkt
		public String url;	//https://pokeapi.co/api/v2/language/1/
	}
	public class cls_flavor_text_entries {
		public String flavor_text;	//An icy punch. Maycause freezing.
		public cls_language language;
		public cls_version_group version_group;
	}
	public class cls_version_group {
		public String name;	//sword-shield
		public String url;	//https://pokeapi.co/api/v2/version-group/20/
	}
	public class cls_generation {
		public String name;	//generation-i
		public String url;	//https://pokeapi.co/api/v2/generation/1/
	}
	public class cls_learned_by_pokemon {
		public String name;	//squirtle
		public String url;	//https://pokeapi.co/api/v2/pokemon/7/
	}
	public class cls_machines {
		public cls_machine machine;
		public cls_version_group version_group;
	}
	public class cls_machine {
		public String url;	//https://pokeapi.co/api/v2/machine/81/
	}
	public class cls_ailment {
		public String name;	//freeze
		public String url;	//https://pokeapi.co/api/v2/move-ailment/3/
	}
	public class cls_category {
		public String name;	//damage+ailment
		public String url;	//https://pokeapi.co/api/v2/move-category/4/
	}
	public class cls_min_hits {
	}
	public class cls_min_turns {
	}
	public class cls_names {
		public cls_language language;
		public String name;	//れいとうパンチ
	}
	public class cls_past_values {
	}
	public class cls_stat_changes {
	}
	public class cls_super_contest_effect {
		public String url;	//https://pokeapi.co/api/v2/super-contest-effect/17/
	}
	public class cls_target {
		public String name;	//selected-pokemon
		public String url;	//https://pokeapi.co/api/v2/move-target/10/
	}
	public class cls_type {
		public String name;	//ice
		public String url;	//https://pokeapi.co/api/v2/type/15/
	}
	public static MoveJSON parse(String json){
		return (MoveJSON) System.JSON.deserialize(json, MoveJSON.class);
	}

}