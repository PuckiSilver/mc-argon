namespace = __name__.split(':')[0]
bit_amt = 16

append function_tag load:load {
    "values": [ f'{namespace}:load' ]
}

scoreboard objectives add f'{namespace}.id' dummy
for i in range(bit_amt):
    scoreboard objectives add f'{namespace}.bit{i}' dummy
