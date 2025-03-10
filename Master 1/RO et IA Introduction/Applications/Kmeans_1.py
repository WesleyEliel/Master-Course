import matplotlib.pyplot as plt
from sklearn.cluster import KMeans
from sklearn.datasets import make_blobs

# Génération de données aléatoires
X, y = make_blobs(n_samples=300, centers=3, cluster_std=0.60, random_state=0)

# Calculer la somme des carrés des distances pour différents nombres de clusters
wcss = []  # WCSS (Within-Cluster Sum of Square)
for i in range(1, 11):
    kmeans = KMeans(n_clusters=i, init='k-means++', max_iter=300, n_init=10, random_state=0)
    kmeans.fit(X)
    wcss.append(kmeans.inertia_)

# Tracer le graphique du coude pour déterminer le meilleur k
plt.figure(figsize=(10, 6))
plt.plot(range(1, 11), wcss)
plt.title('La méthode du coude pour choisir k')
plt.xlabel('Nombre de clusters')
plt.ylabel('WCSS')
plt.show()

# Appliquer K-means avec le k optimal
k_optimal = 3  # Vous pouvez choisir le k en observant le graphique du coude
kmeans_optimal = KMeans(n_clusters=k_optimal, init='k-means++', max_iter=300, n_init=10, random_state=0)
kmeans_optimal.fit(X)
y_kmeans_optimal = kmeans_optimal.predict(X)

# Visualisation des clusters et des centres avec k optimal
plt.figure(figsize=(10, 6))
plt.scatter(X[:, 0], X[:, 1], c=y_kmeans_optimal, s=50, cmap='viridis')
centers_optimal = kmeans_optimal.cluster_centers_
plt.scatter(centers_optimal[:, 0], centers_optimal[:, 1], c='red', s=200, alpha=0.5)
plt.title('Illustration de K-means clustering avec k optimal')
plt.xlabel('Feature 1')
plt.ylabel('Feature 2')
plt.show()
