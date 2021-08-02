////////Capas////////

Capa de presentación:
- Esta capa comprende las clases XIB, ViewControllers, Presenters y Storyboards
- Es la encargada de dar formato a los elementos y de crear modelos de información para las vistas

Capa de Bussiness Logic:
- Esta capa comprende las clases tipo Interactor
- Esta capa es el cerebro del proceso, se encarga de la toma de decisiones basado en la información entrante

Capa de Persistencia (Core Data):
- Esta capa se encarga de almacenar información en cache 
- Aqui se encuentran los modelos autogenerados por Core Data, se accede a ellos a traves de las clases Worker
- No se maneja directamente, si no que usamos al object manager como intermediario

Capa de Networking :
- Esta capa se encarga de las peticiones a servicios 
- Se manejan a traves del NetworkRouter y los Worker  

////////Clases////////

De entre las clases mas usadas y mas importantes destacan las siguientes

XIB:
- Pertenece a la capa de presentación
- En este archivo XML, se definen los componentes visuales que se usaran en una pantalla o una vista, los usamos para crear pantallas enteras o componentes reutilizables 

ViewController :
- Pertenece a la capa de presentación
- Esta clase debe estar libre de cualquier tipo de logica, ya sea de negocios o de presentación
- Sus dos unicas funciones son la de capturar información y presentar la información de los componentes visuales (Data Binding)

Interactor :
- Pertenece a la capa de Bussiness Logic
- Es el cerebro del proceso 
- Esta clase es la encargada de decidir que hacer con la información que recibe del view controller
- Esta clase DECIDE si es necesario navegar a otras pantallas, presentar información, hacer peticiones a los servicios o consultar cache o BD local, pero no ejecuta tales acciones nunca.

Worker : 
- Es el middleware entre el bussines logic y otras capas
- Esta clase es la encargada de obedecer las ordenes del interactor
- Consulta los servicios y a la capa de persistencia
- No toma decisiones

Presenter : 
- Pertenece a la capa de presentación
- Esta clase es la encargada de procesar los datos y moldearlos para su presentación
- Puede tomar decisiones que afecten solamente la presentación
- Es libre de cualquier logica de negocios
- Pasa información al viewcontroller

Router(a nivel de escena) : 
- Esta clase es la encargada de la navegación entre pantallas
- Tambien se encarga del correcto flujo de información entre vistas a traves del protocolo de data passing

NetworkRouter : 
- Pertenece a la capa de networking
- Esta clase es la encargada de construir correctamente una URLRequest

Clases utilitarias
- LocalStrings, enum para manejar strings globales (puede ampliarse para leer de un archivo de localizeds)
- LocalEnvironment, enum para leer información del info.plist
- LocalImages, enum para leer imagenes directo de los assets
- NibNames, enum con los nombres de los archivos XIB
- Displayables, definen una estructura de información de apoyo para las vistas
- Services, originalmente servian para manejar procesos comunes dentro de la aplicación, lo que acostumbro es crear servicios por ejemplo para guardar en user defaults o para el manejo notificaciones internas

////////Preguntas////////

- En qué consiste el principio de responsabilidad única?, Cuál es su propósito?
cada pieza de codigo, ya sea un metodo o una clase, debe tener un solo proposito, y debe tener solo una razon para modificar su comportamiento, si tiene mas de una responsabilidad tiene mas posibilidades de modificar su comportamiento
su proposito es dividir correctamente la funcionalidad, haciendo mas sencillo su manejo.

- Qué características tiene, según su opinión, un “buen” código o código limpio
- Escribir todo en inglés
- No debe tener hardcode, es preferible agrupar todos los hardcode en un grupo de constantes
- Las variables tienen que ser muy claras, es preferible tener nombres largos a tener abreviaciones como noLista (numero de lista)
- Evitar usar ciclos for, y en su lugar usar high end functions
- No usar opcionales
- Evitar el uso de force unwrapping
- Seguir el naming convention para clases y variables
- Borrar codigo no usado
- Nombrar variables por su origen
- Uso de self cuando no sea necesario
- No usar notaciónes inferidas
- No usar operadores ternarios
