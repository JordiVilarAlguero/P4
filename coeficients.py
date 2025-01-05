import matplotlib.pyplot as plt
import numpy as np

def plot_coefficients(file_path, title):
    # Cargamos datos de los fichero txt
    data = np.loadtxt(file_path)
    
    # Separmaos los datos que corresponden a los coeficientes
    x = data[:, 0]
    y = data[:, 1]
    
    # Creamos la figura
    plt.figure()
    plt.scatter(x, y, marker='o', color='purple')
    plt.xlabel('x')
    plt.ylabel('y')
    plt.title(title)

# Invocamos la función para lp, lpcc y mfcc
plot_coefficients('lp.txt', 'LP')
plot_coefficients('lpcc.txt', 'LPCC')
plot_coefficients('mfcc.txt','MFCC')

# Mostrar todas las figuras
plt.show()