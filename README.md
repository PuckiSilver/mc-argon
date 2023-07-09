# **mc-argon**
Match the correct entity when hitting or being hit

## **How to use the Library**
1. Embed the [library](https://github.com/PuckiSilver/mc-argon/releases/latest) into your data pack by copying over the `argon`, `load` and `minecraft` namespaces
    - Be sure to merge where necessary (You most likely need to merge the `load.json` file)

2. Add a function that should be called to one (or multiple) of the following function tags<br>
[`#argon:entity_hurt_player`](src/data/argon/tags/functions/entity_hurt_player.json)<br>
[`#argon:player_hurt_entity`](src/data/argon/tags/functions/player_hurt_entity.json)<br>
[`#argon:player_killed_entity`](src/data/argon/tags/functions/player_killed_entity.json)

## **What can I do in the Function**
- `#argon:entity_hurt_player`
    - `@s` is the **player** that has been hit
    - Using `execute on attacker` you can execute something as the **entity** that has hit the player
- `#argon:player_hurt_entity`
    - `@s` is the **entity** that has been hit
    - Using `execute on attacker` you can execute something as the **player** that has hit the entity
- `#argon:player_killed_entity`
    - `@s` is the **player** that has killed the entity
    - The **entity can't be reached** form this function since it has been killed

---
Check me out on other platforms:

<a href="https://github.com/PuckiSilver" target="_blank">
  <img src="https://github.githubassets.com/favicons/favicon-dark.svg" height="40" width="40"/>
</a>
<a href="https://modrinth.com/user/PuckiSilver" target="_blank">
  <img src="https://docs.modrinth.com/img/logo.svg" height="40" width="40"/>
</a>
<a href="https://www.planetminecraft.com/member/puckisilver" target="_blank">
  <img src="https://www.planetminecraft.com/images/layout/favicon-64.png" height="40" width="40"/>
</a>
