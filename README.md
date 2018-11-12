# Neural-Network---Wine-database
These files contemplate the training and validation process of a multilayer perceptron using Matbalb neural toolbox. For the trained and tested network, a simple application was developed using java with Netbeans.

.java files are related to the codes used to generate the app (.jar file)

.m file is the code used to train, validate and treat the Neural Network

.txt files are the databased used for training and testing the multilayer perceptron

# Database description

- This database was acquired in the UCI Machine Learning Repository (http://archive.ics.uci.edu/ml/index.php), and each
row of the txt files are related to a group of wine parameters used to estimate the classe of each wine instance.

- There are 13 parameters and 3 classes. The database is organized in the following order (each instance):

- Class
- Alcohol
- Malic acid
- Ash
- Alcalinity of ash  
- Magnesium
- Total phenols
- Flavanoids
- Nonflavanoid phenols
- Proanthocyanins
- Color intensity
- Hue
- OD280/OD315 of diluted wines
- Proline            

The number of instances for each class are:
- class 1 : 59
- class 2 : 71
- class 3 : 48

The database was separated considering 70% of data for the training process and 30% for the cross-validation test (M_treinamento.txt and M_teste.txt, respectively). The separation process was careful enought to conciliate
each percentage with the number of instances of each class.

The difference between M_teste.txt and M_teste_final.txt (the same with M_treinamento.txt) is that the inputs were realocated to the 13 first positions and the classes (1, 2 and 3) were realocated to the 14th collum. It was used one of C-class technique to represent the class.



