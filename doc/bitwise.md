# Comprendre le bitwise (avec Pierre 😛)

```sh
array: .word 1, 2, 3, 4
# en C : const int array[] = { 1, 2, 3, 4 };
chaque valeur du tableau est mise dans un espace "word" de 32 bits, soit 4 octets
```

## Pour obtenir la valeur à l'adresse 0 de array (donc array[0]) :

```sh
On lit simplement l'adresse de array.
```

## Pour obtenir la valeur à l'adresse 1 de array (donc array[1]) :

```sh
i = 1, on veut le word suivant de l'adresse de l'array, il faut donc lui ajouter 32 bits (4 octets) :
-> i en bit = 0001
-> on veut 4 en bit = 0100
On peut y accéder avec un décalage de 2 (<<2) : 0001 << 2 = 0100 
```

## Pour obtenir la valeur à l'adresse 2 de array (donc array[2]) :

```sh
i = 2, on veut le word suivant de l'adresse de l'array, il faut donc lui ajouter 64 bits (8 octets) :
-> i en bit = 0010
-> on veut 8 en bit = 1000
On peut y accéder avec un décalage de 2 (<<2) : 0010 << 2 = 1000
```

## Pour obtenir la valeur à l'adresse 3 de array (donc array[3]) :

```sh
i = 3, on veut le word suivant de l'adresse de l'array, il faut donc lui ajouter 96 bits (12 octets) :
-> i en bit = 0011
-> on veut 12 en bit = 1100
On peut y accéder avec un décalage de 2 (<<2) : 0011 << 2 = 1100
```

## Etc.

## Conclusion

```
Ce qui explique le 2 ici : slli t5, t1, 2
# shift left logical immediate = bitwise operator de 2 = <<2
```
