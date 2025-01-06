import matplotlib.pyplot as plt
import numpy as np

def plot_coefficients(file_path, title):
    
    data = np.loadtxt(file_path)
    

    x = data[:, 0]
    y = data[:, 1]
    
 
    plt.figure()
    plt.grid(True)
    plt.scatter(x, y, marker='o', color='tab:olive')
    plt.xlabel('x')
    plt.ylabel('y')
    plt.title(title)

plot_coefficients('lp.txt', 'LP')
plot_coefficients('lpcc.txt', 'LPCC')
plot_coefficients('mfcc.txt','MFCC')

plt.show()