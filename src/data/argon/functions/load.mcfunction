
append function_tag load:load { "values": [ "argon:load" ]}

scoreboard objectives add argon.id dummy
for i in range(16):
    scoreboard objectives add f'argon.bit{i}' dummy
