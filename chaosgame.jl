# Code for the chaos game

using PyCall
@pyimport matplotlib.pyplot as plt

function chaosgame(n, r)
    vertices = [e^(2*pi*im*k/n) for k=1:n]
    seedweights = rand(1,n)
    seedweights = 1/sum(seedweights)*seedweights
    seed = seedweights*vertices
    plt.axis([-1, 1, -1, 1])
    plt.ion()

    for j=1:25
        seed = (1-r)*seed + r*rand(vertices)
    end
    for j = 1:5000
        seed = (r)*seed + (1-r)*rand(vertices)
        plt.scatter(real(seed), imag(seed), marker = ".")
        #plt.pause(0.0001)
    end

    while true
        plt.pause(0.05)
    end
end

chaosgame(6, 1/3)



