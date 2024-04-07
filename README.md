Dentro del código están los comentarios explicándo que hace cada función. 
Este smart contract es un sistema de votaciones, el cual permitirá:
1. Crear propuestas por una dirección específica:  0xb3561860138E1636d69847E1F5250Cb082eD6Fa9
2. Votar. Las direcciones que tienen permitidos votar son:
        0x20feca641901BE6Df9215A0858a21012f1ea37Dd,
        0x97D43e7c25b23de49e07089C2cC7eeE2b7771061,
        0xB55E53acc7345c2B611Aa06e049f250B4c3e7273,
        0xC0f780e1909Cc4F051f9723C299a717a46D75483,
        0xdAC17F958D2ee523a2206206994597C13D831ec7,
        0x90F8bf6A479f320ead074411a4B0e7944Ea8c9C1,
        0xFFcf8FDEE72ac11b5c542428B35EEF5769C409f0,
        0xFABB0ac9d68B0B445fB7357272Ff202C5651694a,
        0x0123456789012345678901234567890123456789
   Muchas de estas direcciones son direccione que no están asociadas a alguna cuenta, pero otras que sí, las cuales fueron creadas a partir de Metamask.

Comentarios:
1. Las votaciones solo serán permitidas para las cuentas específicadas anteriormente
2. Una cuenta solo podrá votar una vez
3. Las votaciones serán cerradas 3 días después de desplegarse el smart contract en la blockchain de Sepolia.

El smart contract tiene un atributo público "enableAddress" que permite consultar el address para crear las propuestas -Por facilidad-. También tiene  varias funciones públicas: 
"createProposal": Recibe el nombre de la prupuesta y el address que creará las propuestas. Esta función crea las propuestas.
"vote": Recibe el nombre de la propuesta por la cual va a votar y la dirección que va a votar. Esta función agrega los votos a la propuesta votada.
"getProposalWithIndex": Recibe un index, con el cuál se podrá traer el nombre de la propuesta y la cantidad de votos que tiene dicha propuesta.
"getTotalProposas": No recibe parametros y retorna el total de propuestas que hay. Esto como modo informativo.
"IsATime": No recibe parametros y retorna si las votaciones aún están permitidas o no.


Este smart contract fue desplegado en la blockchain de Sepolia domingo 7 de abril a las 5:20 PM, por tanto deverían estar cerradas las votaciones el día miércoles 10 de abril
a las 5:20 pm. La página para encontrar el SC es la siguiente:
https://sepolia.etherscan.io/

Y el número del SC es: 0x8B1305e75575A2B5b591CA6643aE7815F3Cd751D




