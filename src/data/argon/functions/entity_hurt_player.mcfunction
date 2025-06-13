scoreboard players set .is_direct argon.flags 0
if entity @s[advancements={./entity_hurt_player={direct=true}}] scoreboard players set .is_direct argon.flags 1
function #./entity_hurt_player
scoreboard players reset .is_direct argon.flags
advancement revoke @s only ./entity_hurt_player
