namespace = __name__.split(':')[0]

append function_tag load:load {
    "values": [ f'{namespace}:load' ]
}

scoreboard objectives add f'{namespace}.id' dummy
for i in range(16):
    scoreboard objectives add f'{namespace}.bit{i}' dummy
