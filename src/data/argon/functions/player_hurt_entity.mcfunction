from mecha import Mecha
mc = ctx.inject(Mecha)
from ./load import bit_amt

namespace = __name__.split(':')[0]

scoreboard players set #found f'{namespace}.id' 0

selector = "@s[advancements={./player_hurt_entity={"
for i in range(bit_amt):
    selector += f'bit{i}=false,'
selector += "}}]"

if entity mc.parse(selector, using="selector") function ~/setup/as_player:
        tag @s add f'{namespace}.player'
        as @e[type=!#./non_living,predicate=./not_setup,sort=nearest] function ~/../as_entity:
            if score #found f'{namespace}.id' matches 1 return -1
            on attacker if entity @s[type=player,tag=f'{namespace}.player'] scoreboard players set #found f'{namespace}.id' 1
            if score #found f'{namespace}.id' matches 0 return -1
            function #./player_hurt_entity
            execute function ~/../setup_id:
                scoreboard players add .global f'{namespace}.id' 1
                if score .global f'{namespace}.id' matches 65537.. scoreboard players set .global f'{namespace}.id' 1
                scoreboard players operation @s f'{namespace}.id' = .global f'{namespace}.id'
                scoreboard players operation #id f'{namespace}.id' = .global f'{namespace}.id'

                for i in range (bit_amt-1,-1,-1):
                    pow = 2**i
                    if score #id f'{namespace}.id' matches (pow, None) scoreboard players set @s f'{namespace}.bit{i}' 1
                    if i != 0:
                        if score #id f'{namespace}.id' matches (pow, None) scoreboard players remove #id f'{namespace}.id' pow

        tag @s remove f'{namespace}.player'

        if score #found f'{namespace}.id' matches 0 function #./player_killed_entity
        if score #found f'{namespace}.id' matches 0 scoreboard players set #found f'{namespace}.id' 2

unless score #found f'{namespace}.id' matches 0 advancement revoke @s only ./player_hurt_entity
unless score #found f'{namespace}.id' matches 0 return 0

scoreboard players reset #id f'{namespace}.id'
for i in range(bit_amt):
    pow = 2**i
    if entity @s[advancements={./player_hurt_entity={f'bit{i}'=true}}] scoreboard players add #id f'{namespace}.id' pow

as @e[type=!#./non_living,sort=nearest,limit=1,predicate=./match_id] function ~/as_entity:
    scoreboard players set #found f'{namespace}.id' 1
    function #./player_hurt_entity

if score #found f'{namespace}.id' matches 0 run function #./player_killed_entity

advancement revoke @s only ./player_hurt_entity


predicate ./not_setup {
    "condition": "minecraft:value_check",
    "value": {
        "type": "minecraft:score",
        "target": "this",
        "score": f'{namespace}.id'
    },
    "range": 0
}

predicate ./match_id {
    "condition": "minecraft:value_check",
    "value": {
        "type": "minecraft:score",
        "target": "this",
        "score": f'{namespace}.id'
    },
    "range": {
        "min": {
            "type": "minecraft:score",
            "target": {
                "type": "minecraft:fixed",
                "name": "#id"
            },
            "score": f'{namespace}.id'
        },
        "max": {
            "type": "minecraft:score",
            "target": {
                "type": "minecraft:fixed",
                "name": "#id"
            },
            "score": f'{namespace}.id'
        }
    }
}

entity_type_tag ./non_living { "values": [ # https://github.com/HeDeAnTheonlyone/Taglib/blob/main/data/taglib/tags/entity_types/non_living.json
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