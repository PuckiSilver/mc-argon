from mecha import Mecha
mc = ctx.inject(Mecha)

scoreboard players set #found argon.id 0

selector = "@s[advancements={./player_hurt_entity={"
for i in range(16):
    selector += f'bit{i}=false,'
selector += "}}]"

if entity mc.parse(selector, using="selector") function ~/setup/as_player:
    tag @s add argon.player
    as @e[type=!#./non_living,predicate=!./has_id,sort=nearest] function ~/../as_entity:
        if score #found argon.id matches 1 return -1
        on attacker if entity @s[type=player,tag=argon.player] scoreboard players set #found argon.id 1
        if score #found argon.id matches 0 return -1
        at @s function #./player_hurt_entity
        execute function ~/../setup_id:
            scoreboard players add .global argon.id 1
            if score .global argon.id matches 65537.. scoreboard players set .global argon.id 1
            scoreboard players operation @s argon.id = .global argon.id
            scoreboard players operation #id argon.id = .global argon.id

            for i in range (16-1,-1,-1):
                pow = 2**i
                if score #id argon.id matches (pow, None) scoreboard players set @s f'argon.bit{i}' 1
                if i != 0:
                    if score #id argon.id matches (pow, None) scoreboard players remove #id argon.id pow

    tag @s remove argon.player

    if score #found argon.id matches 0 function #./player_killed_entity
    if score #found argon.id matches 0 scoreboard players set #found argon.id 2

unless score #found argon.id matches 0 return run advancement revoke @s only ./player_hurt_entity

scoreboard players reset #id argon.id
for i in range(16):
    pow = 2**i
    if entity @s[advancements={./player_hurt_entity={f'bit{i}'=true}}] scoreboard players add #id argon.id pow

as @e[type=!#./non_living,limit=1,predicate=./match_id] function ~/as_entity:
    scoreboard players set #found argon.id 1
    at @s function #./player_hurt_entity

if score #found argon.id matches 0 run function #./player_killed_entity

advancement revoke @s only ./player_hurt_entity


predicate ./has_id {
    "condition": "minecraft:entity_scores",
    "entity": "this",
    "scores": { "argon.id": {}}
}

predicate ./match_id {
    "condition": "minecraft:entity_scores",
    "entity": "this",
    "scores": {
        "argon.id": {
            "min": {
                "type": "minecraft:score",
                "target": { "type": "minecraft:fixed", "name": "#id" },
                "score": "argon.id"
            },
            "max": {
                "type": "minecraft:score",
                "target": { "type": "minecraft:fixed", "name": "#id" },
                "score": "argon.id"
            }
        }
    }
}

entity_type_tag ./non_living { "values": [ # https://github.com/HeDeAnTheonlyone/Taglib/blob/main/data/taglib/tags/entity_type/non_living.json
    { "id": "minecraft:arrow", "required": false },
    { "id": "minecraft:painting", "required": false },
    { "id": "minecraft:experience_orb", "required": false },
    { "id": "minecraft:eye_of_ender", "required": false },
    { "id": "minecraft:falling_block", "required": false },
    { "id": "minecraft:fireball", "required": false },
    { "id": "minecraft:firework_rocket", "required": false },
    { "id": "minecraft:item", "required": false },
    { "id": "minecraft:potion", "required": false },
    { "id": "minecraft:small_fireball", "required": false },
    { "id": "minecraft:snowball", "required": false },
    { "id": "minecraft:tnt", "required": false },
    { "id": "minecraft:trident", "required": false },
    { "id": "minecraft:minecart", "required": false },
    { "id": "minecraft:tnt_minecart", "required": false },
    { "id": "minecraft:command_block_minecart", "required": false },
    { "id": "minecraft:chest_minecart", "required": false },
    { "id": "minecraft:hopper_minecart", "required": false },
    { "id": "minecraft:furnace_minecart", "required": false },
    { "id": "minecraft:spawner_minecart", "required": false },
    { "id": "minecraft:boat", "required": false },
    { "id": "minecraft:chest_boat", "required": false },
    { "id": "minecraft:dragon_fireball", "required": false },
    { "id": "minecraft:egg", "required": false },
    { "id": "minecraft:end_crystal", "required": false },
    { "id": "minecraft:ender_pearl", "required": false },
    { "id": "minecraft:evoker_fangs", "required": false },
    { "id": "minecraft:experience_bottle", "required": false },
    { "id": "minecraft:fishing_bobber", "required": false },
    { "id": "minecraft:leash_knot", "required": false },
    { "id": "minecraft:lightning_bolt", "required": false },
    { "id": "minecraft:llama_spit", "required": false },
    { "id": "minecraft:shulker_bullet", "required": false },
    { "id": "minecraft:spectral_arrow", "required": false },
    { "id": "minecraft:wither_skull", "required": false },
    { "id": "minecraft:armor_stand", "required": false },
    { "id": "minecraft:marker", "required": false },
    { "id": "minecraft:area_effect_cloud", "required": false },
    { "id": "minecraft:item_frame", "required": false },
    { "id": "minecraft:glow_item_frame", "required": false },
    { "id": "minecraft:interaction", "required": false },
    { "id": "minecraft:block_display", "required": false },
    { "id": "minecraft:text_display", "required": false },
    { "id": "minecraft:item_display", "required": false }
]}
