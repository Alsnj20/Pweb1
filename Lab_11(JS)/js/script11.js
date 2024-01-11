//Property Functions{
    const reproductor = {
        reproducir: function (id) {
            console.log(`Reproducir ID: ${id}`)
        },
        pausar: function (id) {
            console.log(`Pausar ID: ${id}`)
        }
    }
    reproductor.pausar();
    reproductor.reproducir(5);