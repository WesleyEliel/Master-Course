# Importation des bibliothèques
import cv2
import numpy as np
import tensorflow as tf
from matplotlib import pyplot as plt

# Initialisation des données sous un format de donnée compréhensible par keras
# Les données sont dans le dossier "data" qui est à la racine du projet
data = tf.keras.utils.image_dataset_from_directory('data')

# Normalization des données pour un meilleur apprentissage
data = data.map(lambda x, y: (x / 255, y))
data.as_numpy_iterator().next()

# Définition de la taille des données d' entrainement, validation et test
train_size = int(len(data) * .7)  # 70% des données pour l' apprentissage
val_size = int(len(data) * .2)  # 20% pour la validation
test_size = int(len(data) * .1)  # Pour tester, les 10% restants

# Préparer les données en fonction de la taille définie plus haut
train = data.take(train_size)
val = data.skip(train_size).take(val_size)
test = data.skip(train_size + val_size).take(test_size)

# Initialiser un model d' entrainement
model = tf.keras.models.Sequential()

## Ajouter les couche des manière hiérarchique et séquentielle

# 1ère couche: Couche de convolution avec 16 filtres de tailles 3 x 3, des pas de 1 avec la fonction d' activation Relu
model.add(tf.keras.layers.Conv2D(16, (3, 3), 1, activation='relu', input_shape=(256, 256, 3)))

# 2nde couche: Couche de Pooling avec la fonction Max Pooling
model.add(tf.keras.layers.MaxPooling2D())

# 3ème couche: Couche de convolution avec 32 filtres de taille 3 x 3, des pas de 1, avec la fonction d' activation Relu
model.add(tf.keras.layers.Conv2D(32, (3, 3), 1, activation='relu'))

# 4ème couche: Couche de Pooling avec la fonction Max Pooling
model.add(tf.keras.layers.MaxPooling2D())

# 5ème couche: Couche de convolution avec 16 filtres de taille 3 x 3, des pas de 1, avec la fonction d' activation Relu
model.add(tf.keras.layers.Conv2D(16, (3, 3), 1, activation='relu'))

# 4ème couche: Couche de Pooling avec la fonction Max Pooling
model.add(tf.keras.layers.MaxPooling2D())

# Opération Flattening
model.add(tf.keras.layers.Flatten())

# 1ère couche entièrement connectée
model.add(tf.keras.layers.Dense(256, activation='relu'))

# 2ème couche entièrement connectée: Couche de Sortie avec une fonction d' activation sigmoid
model.add(tf.keras.layers.Dense(1, activation='sigmoid'))

# Compilation du modèle
model.compile('adam', loss=tf.losses.BinaryCrossentropy(), metrics=['accuracy'])

# Affichage des détails du modèle ci dessus défini
model.summary()

tensorboard_callback = tf.keras.callbacks.TensorBoard(
    log_dir='logs',
    histogram_freq=0,
    write_graph=True,
    write_images=False,
    write_steps_per_second=False,
    update_freq='epoch',
    profile_batch=0,
    embeddings_freq=0,
    embeddings_metadata=None
)

# Lancement de l' entrainement du model
# Params:
#   epochs: nombre de rétro propagation.
#   validation_data: données de validation
#   callbacks: # A chercher
hist = model.fit(train, epochs=11, validation_data=val, callbacks=[tensorboard_callback])

# Afficher l' historique
print(hist.history)

###### Essaie de classification d' une image avec le model entrainé  #############""

# Lecture d' une image test
img = cv2.imread('test.jpeg')

# Affichage de l' image en format RGB ( Avec Jupyter de préférence )
plt.imshow(cv2.cvtColor(img, cv2.COLOR_BGR2RGB))
plt.show()

img = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)

# Revoir la taille de l' image au même format que la taille d' entrainment
resize = tf.image.resize(img, (256, 256))
np.expand_dims(resize, 0)

# Utiliser le model pour prédire le résultat
test_prediction = model.predict(np.expand_dims(resize / 255, 0))

# Retourner la prédiction de la machine
if test_prediction > 0.5:
    print(f'\n \n La classe prédite est la classe "Villes" \n \n ')
else:
    print(f'\n \n La classe prédite est la classe "Montagnes" \n \n ')
