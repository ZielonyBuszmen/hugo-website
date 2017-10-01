---
title: Binarne drzewo poszukiwań – Binary Search Tree (BST)
author: Krzysiek Komar
type: post
date: 2017-02-20T15:00:38+00:00
url: /2017/02/20/binarne-drzewo-poszukiwan-binary-search-tree-bst/
categories:
  - Programowanie
tags:
  - Algorytmy i struktury danych
  - 'C#'
  - Programowanie

---
Drzewo to hierarchiczna struktura danych. Co to znaczy? Że do jego „obsługi” w kodzie będziemy musieli używać rekurencji (tej trudnej i nieciekawej). Na początku przyjrzymy się, jak to wszystko wygląda na obrazkach, dopiero potem zaimplementujemy naszą wiedzę w kodzie.

Drzewo składa się z węzłów (**nodes**). Każdy z nich posiada <u>co najwyżej</u> dwóch _następników._ Stąd też nazwa „binarne”, bo binarny to „dwójkowy”, zawierający dwa elementy). Drzewo posiada tzw. „węzeł nadrzędny” (**root**). Jego następniki są nazywane węzłami _potomnymi (dziecko, potomek) (**child nodes).**_

<img class="wp-image-61 aligncenter" title="" src="http://localhost/blog_wordpress/wp-content/uploads/2017/02/Clipboard01-300x213.png" alt="" width="541" height="384" srcset="http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/Clipboard01-300x213.png 300w, http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/Clipboard01-768x546.png 768w, http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/Clipboard01-1024x728.png 1024w, http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/Clipboard01-820x583.png 820w, http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/Clipboard01.png 1178w" sizes="(max-width: 541px) 100vw, 541px" />

Istnieje jedna i podstawowa reguła drzewa binarnego – Wszystkie elementy znajdujące się w lewym poddrzewie są mniejsze od swojego ojca, natomiast elementy w prawym poddrzewie są większe od swojego ojca. Reguła to obowiązuje zawsze i wszędzie, na wszystkie poddrzewa.

A co z elementami równymi? To już kwestia własnego ustalenia. Zazwyczaj takie elementy wrzuca się na prawo.

Na obrazku rootem (głównym węzłem) drzewa jest liczba 8. Ma ona dwóch potomków: 3 oraz 10. Następnie 3 też ma dwóch potomków: 1 oraz 6. Można więc powiedzieć, że 3 jest ojcem dla 1 i 6. Bądź 14 jest ojcem 13; albo że 8 jest ojcem 3 i 10. Warto zauważyć, że np. taka 14 posiada tylko lewego potomka 13. Węzeł 4 nie ma potomków w ogóle.

Na tym zakończylibyśmy tą całą otoczkę teoretyczną. Nie omówiliśmy takich rzeczy jak dodawanie węzła, przeszukiwanie drzewa, itp. To wszystko można znaleźć w tym filmiku: [**https://youtu.be/_V7a1Gwuj5k?t=37m46s**][1]  (od **37:46** do **45:20**). Gościu fajnie tłumaczy, ALE nie polecam sugerować się jego kodem. BO jego drzewo jest w C++ ORAZ po drugie i najważniejsze – stosuje **tablicową implementację drzewa**, która do niczego nam się nie przyda. Bo my musimy napisać drzewo „z prawdziwego zdarzenia”, a nie jakieś tablicowe śmieszki.

Warto jeszcze nadmienić, że w tym artykule nie będzie pokazane całe drzewo ze wszystkimi jego możliwościami, itd. Po taką wiedzę zapraszam piętro niżej, do wydziału leśnego. No bo kto jak kto, ale oni o drzewach wiedzą najwięcej.

&nbsp;

# **Implementacja**

<pre class="brush: csharp; gutter: false; title: ; notranslate" title="">public class Node
	{
		int number;
		Node left;
		Node right;
	}
</pre>

Klasa nazywa się Node, czyli węzeł. Zawiera trzy pola: **number**, **left** oraz **right**.

  * `int number;` &#8211; to liczba, czyli to, co dany węzeł ma przechowywać. W węzłach nie będziemy przetrzymywać wymyślnych klientów, adresów, czy innego barachła. Tylko zwykłą i najprostszą liczbę, tak jak to było wyżej na rysunku.
  * `Node left;` &#8211; **referencja (odwołanie) **do lewego dziecka.
  * `Node right;` &#8211; **referencja (odwołanie) **do prawego dziecka.

Na początku może to wyglądać dziwnie – klasa Node posiada dwa pola typu Node? Tak. Tak jak już było wspomniane – drzewo to struktura hierarchiczna, więc takie coś jest na początku dziennym. I takie coś trzeba będzie wertować rekurencyjnie (niestety).

&nbsp;

Druga klasa, którą stworzymy zaraz pod kodem klasy węzła, będzie klasą drzewa:

<pre class="brush: csharp; gutter: false; title: ; notranslate" title="">public class Tree
    {
        Node root;
        int counter;
    }
</pre>

Drzewo – czyli **Tree**. Klasa zawiera dwa pola:

  * `Node root;` &#8211; **refrencja (odwołanie) **do głównego węzła, do _korzenia_ tego drzewa
  * `int counter;`funkcją będzie funkc &#8211; a tutaj taki mały licznik elementów drzewa, nie musi on tutaj być, ale dlaczego by go nie zrobić dla picu? 😉

# **Teraz zajmiemy się implementacją węzła <u>(node)</u>**

<pre class="brush: csharp; highlight: [7,8,9,10,11,12,13,14,15,16,17]; title: klasa węzła (node); notranslate" title="klasa węzła (node)">public class Node
    {
        int number;
        Node left;
        Node right;

        public Node(int value)    // konstruktor
        {
            this.number = value;   //1
            this.left = null;      //2
            this.right = null;     //2
        }

        public bool IsLeaf()
        {
            return (this.left == null && this.right == null);
        }
</pre>

Dodaliśmy do kodu dwie funkcje. Pierwsza z nich to konstruktor, do którego przekazujemy tylko jeden parametr – wartość węzła, którą zaraz przypisujemy do pola `int numer (//1)`. W kolejnych dwóch linijkach przypisujemy odwołania do lewego i prawego dziecka tego węzła -> z racji tego, że ten węzeł jest „nowo narodzony” to nie ma dzieci, po prostu przypisujemy im nulle `(//2).`

Druga funkcja `bool IsLeaf()`, sprawdza, czy węzeł jest liściem. A węzeł jest liściem, gdy nie posiada dzieci. Każdy „nowo upieczony” węzeł będzie liściem, bo nie będzie posiadał ani lewego dziecka, ani prawego. Wtedy funkcja zwraca `true`. Gdy węzeł nie jest liściem, czyli posiada jedno lub dwoje dzieci, to funkcja zwraca `false`.

&nbsp;

Kolejną funkcją będzie funkcja przeszukująca pod-węzły pod kątem danej wartości:

<pre class="brush: csharp; first-line: 18; highlight: [20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50]; title: Klasa węzła (node); notranslate" title="Klasa węzła (node)">// .............  //

	public Node Search(int value)  //0
	{
		if (this.number == value)      //1
		{
			return this;
		}
		else if (value &lt; this.number)    //2
		{
			if (this.left == null)  //3
			{
				return null;
			}
			else
			{
				return this.left.Search(value);  //4
			}

		}
		else if (value &gt; this.number)  //5
		{
			if (this.right == null)   //6
			{
				return null;
			}
			else
			{
				return this.right.Search(value);   //7
			}
		}
		return null;  //8
	} 

</pre>

Do funkcji `Node Search(int value)` wrzucamy wartość jaką chcemy znaleźć. Funkcja przeszukuje dany węzeł, dzieci tego węzła oraz dzieci-dzieci i dzieci-dzieci-dzieci, itd.

Gdy znajdzie – zwraca ten węzeł. Gdy nie znajdzie – zwraca null;

Przeanalizujmy tą funkcję. Składa się ona z trzech **ifów. **Pierwszy sprawdza, czy liczba której szukamy nie jest liczbą w obecnym węźle **(//1)**. Jeśli tak, to od razu zwracamy ten węzeł i kończymy funkcję.

Drugi i trzeci wypadek jest bardziej złożony. Oba są na szczęście prawie że identyczne.

**(//2)** Jeśli szukana liczba jest mniejsza od tej z danego węzła, to wiadomo, że musimy szukać w lewym potomku tego węzła. Heh, ale jeśli nasz węzeł nie posiada lewego potomka to musimy zakończyć nasze poszukiwania fiaskiem **(//3)**. Ale gdy istnieje lewy potomek to co? **(//4)** To wtedy szukamy w nim tej wartości. I teraz **uwaga!** Tutaj mamy tą _zdradziecką_ rekurencję. Przeanalizujmy dokładnie tą linijkę:

<pre class="brush: csharp; light: true; title: ; notranslate" title="">return this.left.Search(value); </pre>

`this.left` to odwołanie do lewego dziecka naszego węzła. `this.left.Search()` to odwołanie się do funkcji `Search()`, czyli do tej w której obecnie jesteśmy, ale z tą różnicą, że wywołujemy ją dla lewego dziecka. Przekazujemy do niej to samo `value`, które widnieje tam wyżej **(//0)**. Na samym początku linijki daliśmy `return`, przez co wszystko będzie wykonywać się rekurencyjne aż do znalezienia odpowiedniego węzła i jego zwrócenia **(//1)**. Albo nieznalezienia i zwrócenia null **(//8)**.

Analogicznie postępujemy w trzeciej części tej funkcji, gdy szukana liczba jest większa lub równa od liczby przechowywanej w naszym węźle. **(//5).** Najpierw sprawdzamy, czy w ogóle istnieje prawy pod-węzeł **(//6). **Jeśli istnieje **(//7)** to zaczynamy przeszukiwać prawy węzeł i ewentualnie jego podwęzły (tak jak to miało miejsce z lewej strony).

Gdy żaden z tych 3 **ifów **się nie wykona, to pozostaje nam zwrócić null **(//8), **czyli informację o nieznalezieniu węzła o takiej wartości.

# **Dodawanie węzła do struktury**

<pre class="brush: csharp; first-line: 51; highlight: [53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77]; title: Klasa węzła (node); notranslate" title="Klasa węzła (node)">// ..............  //

	public void Add(int value)        //0
	{
		if (value &gt;= this.number)    //1
		{
			if (this.right == null) 
			{
				this.right = new Node(value);  //2
			}
			else
			{
				this.right.Add(value);    //3
			}
		}
		else if (value &lt; this.number)    //4
		{
			if (this.left == null)
			{
				this.left = new Node(value);    //5
			}
			else
			{
				this.left.Add(value);     //6
			}
		}
	}

</pre>

Funkcja `Add()` jest bliźniaczo podobna do omówionej wcześniej funkcji `Search()`. Przekazujemy do niej wartość, którą chcemy dodać do węzła (a dokładniej – do dzieci tego węzła)**(//0). **Funkcja składa się z dwóch głównych ifów **(//1),(//4)**. Pierwszy z nich **(//1) **wykona się wtedy, gdy liczba którą chcemy wpisać będzie większa od tej w aktualnym węźle. Jeśli tak się stanie, to najpierw sprawdzamy, czy dany węzeł posiada prawego potomka. Jeśli nie, to sprawa jest prosta. Tworzymy tego prawego potomka i przypisujemy mu naszą wartość **(//2).** W przeciwnym wypadku, gdy prawy węzeł istnieje, dzieje się rekurencja **(//3), **czyli znowu wywołujemy funkcję `Add()`, tylko z tą różnicą, że nie dla naszego węzła, a dla jego prawego potomka.

Dodawanie lewego węzła dzieje się analogicznie. W przypadku, gdy dodawana wartość jest mniejsza od tej w aktualnym węźle, to musimy wrzucić ją na lewo **(//4). **Gdy lewy pod-węzeł nie istnieje to sprawa jest prosta – tworzymy go z wartością którą chcemy dodać **(//5).** Gdy takowy węzeł istenieje, wywołujemy na nim funkcję `Add()` **(//6)**, identycznie jak wcześniej.

# **Wyświetlanie węzła i jego dzieci (i dzieci jego dzieci, itd.)**

<pre class="brush: csharp; first-line: 79; highlight: [79,80,81,82,83,84,85,86,87,88,89,90]; title: Klasa węzła (node); notranslate" title="Klasa węzła (node)">public void Display()
        {
            if (this.left != null)   
            {
                this.left.Display();     //1
            }
            Console.Write(" " + this.number);    //2
            if (this.right != null)
            {
                this.right.Display();     //3
            }
        }
    }
</pre>

Kolejną funkcją jest `Display()`, która będzie wyświetlała nasz węzeł, oraz wszystkie jego dzieci (i dzieci ich dzieci, itd.). Funkcja ta (jak i każda inna wcześniej przedstawiona) jest niestety rekurencyjna. Wyświetlenie węzła to po prostu wyświetlenie jego wartości, czyli zmiennej `number`. Wystarczy zwykłe `Console.Write()` ze spacją z przodu (albo z tyłu, kto jak tam woli).**(//2). **Ale wyświetlenie jednej wartości nie wystarczy – musimy przecież wyświetlić całą strukturę. Stąd też powyżej linijki **//2 **oraz poniżej tworzymy dwa warunki. Ten powyżej **(//1) **sprawdza, czy nasz węzeł posiada lewe dziecko. Jeśli tak, to wywołuje na jego rzecz tą samą funkcję `Display()`. Analogicznie dzieje się poniżej **(//3). **W przypadku gdy istnieje prawe dziecko to wywołujemy na jego rzecz funkcję `Display()`.

# **Wreszcie możemy przejść do drzewa (tree)**

<pre class="brush: csharp; first-line: 93; highlight: [98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140]; title: Klasa drzewa (tree); notranslate" title="Klasa drzewa (tree)">public class Tree
    {
        Node root;
        int counter;

        public Tree()       //1
        {
            root = null;
            counter = 0;
        }
	
        public bool IsEmpty()    //2  
        {
            return this.root == null; 
        }

        public void Add(int value)   //3
        {
            if (IsEmpty())
            {
                this.root = new Node(value);   //4
            }
            else
            {
                this.root.Add(value);     //5
            }
            counter++;
        }

        public bool Search(int value)     //6
        {
            if (this.root.Search(value) != null) return true;    //7
            else return false;
        }


        public void Display()    //8
        {
            if (IsEmpty() == false)   //9
            {
                this.root.Display();
            }
        }

        public int Count()   //10
        {
            return this.counter;
        }

    }
</pre>

Na początku tworzymy standardowy konstruktor. **(//1). **Do głównego korzenia drzewa (**root**) przypisujemy null (bo nowe drzewo jest zawsze puste), i licznik (**counter**) ustawiamy na ****.

Kolejna funkcja to `IsEmpty()` **(//2). **Działanie jej jest proste – zwraca true gdy drzewo (czyli korzeń) jest pusty (**null**). W przeciwnym wypadku zwraca false.

Dalej mamy funkcję `Add()`, **(//3)** która dodaje element do drzewa. Jest ona bardzo prosta, a to dlatego, że całe właściwe dodawanie węzła znajduje się we wcześniej omówionym kodzie – w klasie Node. Na początku sprawdzamy, czy nasze drzewo jest puste (wszystko dzięki wcześniej napisanej funkcji IsEmpty()). Jeśli tak, to nowy węzeł musimy wrzucić na miejsce roota **(//4). **W przeciwnym wypadku, czyli gdy drzewo nie jest puste, nową wartość musimy upakować gdzieś w strukturze. Jednak cały kod dodawania już napisaliśmy, więc wystarczy wywołaj funkcję `Add()` z klasy `Node` dla naszego korzenia (**root**) **(//5). **Na końcu zwiększamy licznik elementów w drzewie.

Przedostatnią funkcją jest `Display()`, który wyświetla nasze całe drzewo. **(//8) **Dzieje się to tylko w przypadku, gdy nie jest ono puste **(//9). **Całe wyświetlanie polega na wywołaniu funkcji `Display()` z klasy **Node** dla naszego głównego węzła (**root**).

Ostatnia funkcja to `Count()` **(//10), **która zwraca ilość elementów w drzewie, czyli wartość naszego licznika.

# **Wykorzystanie kodu drzewa w Main()**

<pre class="brush: csharp; first-line: 144; title: Funkcja Main(); notranslate" title="Funkcja Main()">static void Main(string[] args)
      {
            Tree brzoza = new Tree();  // stworzenie drzewa – brzozy 
            brzoza.Add(7);    // bo sosna to tylko na opał się nadaje 
            brzoza.Add(12);   // dodawanie elementów do drzewa
            brzoza.Add(4);
            brzoza.Add(1);
            brzoza.Add(8);
            brzoza.Add(12);
            brzoza.Add(63);
            brzoza.Add(2);

            Console.WriteLine("Drzewo posiada {0} elementów", brzoza.Count());

            brzoza.Display();  // wyświetlenie całego drzewa
            Console.WriteLine();

            Console.WriteLine("Czy w drzewie znajduje się liczba 4?");
            Console.WriteLine(brzoza.Search(4));

            Console.WriteLine("Czy w drzewie znajduje się liczba 23?");
            Console.WriteLine(brzoza.Search(23));

            brzoza.Add(23);

            Console.WriteLine("Czy w drzewie znajduje się liczba 23?");
            Console.WriteLine(brzoza.Search(23));

            Console.ReadKey();
      }
</pre>

&nbsp;

# **Kilka rysunków**

## **Diagramy UML klas:**

<img class="aligncenter wp-image-86 " src="http://localhost/blog_wordpress/wp-content/uploads/2017/02/uml-dzrzewo-bst.png" width="613" height="282" srcset="http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/uml-dzrzewo-bst.png 1083w, http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/uml-dzrzewo-bst-300x138.png 300w, http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/uml-dzrzewo-bst-768x353.png 768w, http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/uml-dzrzewo-bst-1024x471.png 1024w, http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/uml-dzrzewo-bst-820x377.png 820w" sizes="(max-width: 613px) 100vw, 613px" />

## **Przykładowe drzewo**

<img class="wp-image-85 aligncenter" src="http://localhost/blog_wordpress/wp-content/uploads/2017/02/drzewo-bst.png" width="699" height="663" srcset="http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/drzewo-bst.png 874w, http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/drzewo-bst-300x285.png 300w, http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/drzewo-bst-768x728.png 768w, http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/drzewo-bst-820x778.png 820w" sizes="(max-width: 699px) 100vw, 699px" />

# **Cały kod:**

## <http://wklej.org/id/3021727/>

<pre class="brush: csharp; collapse: true; light: false; title: ; toolbar: true; notranslate" title="">using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace tree
{
    public class Node
    {
        int number;
        Node left;
        Node right;

        public Node(int value)    // konstruktor
        {
            this.number = value;   //1
            this.left = null;      //2
            this.right = null;     //2
        }

        public bool IsLeaf()
        {
            return (this.left == null && this.right == null);
        }

        public Node Search(int value)  //0
        {
            if (this.number == value)      //1
            {
                return this;
            }
            else if (value &lt; this.number) //2 { if (this.left == null) //3 { return null; } else { return this.left.Search(value); //4 } } else if (value &gt; this.number)  //5
            {
                if (this.right == null)   //6
                {
                    return null;
                }
                else
                {
                    return this.right.Search(value);   //7
                }
            }
            return null;  //8
        }

        public void Add(int value)        //0
        {
            if (value &gt;= this.number)    //1
            {
                if (this.right == null)
                {
                    this.right = new Node(value);  //2
                }
                else
                {
                    this.right.Add(value);    //3
                }
            }
            else if (value &lt; this.number)    //4
            {
                if (this.left == null)
                {
                    this.left = new Node(value);    //5
                }
                else
                {
                    this.left.Add(value);     //6
                }
            }
        }

        public void Display()
        {
            if (this.left != null)
            {
                this.left.Display();     //1
            }
            Console.Write(" " + this.number);    //2
            if (this.right != null)
            {
                this.right.Display();     //3
            }
        }
    }


    public class Tree
    {
        Node root;
        int counter;

        public Tree()       //1
        {
            root = null;
            counter = 0;
        }

        public bool IsEmpty()    //2  
        {
            return this.root == null;
        }

        public void Add(int value)   //3
        {
            if (IsEmpty())
            {
                this.root = new Node(value);   //4
            }
            else
            {
                this.root.Add(value);     //5
            }
            counter++;
        }

        public bool Search(int value)     //6
        {
            if (this.root.Search(value) != null) return true;    //7
            else return false;
        }


        public void Display()    //8
        {
            if (IsEmpty() == false)   //9
            {
                this.root.Display();
            }
        }

        public int Count()   //10
        {
            return this.counter;
        }

    }

    class Program
    {
        static void Main(string[] args)
        {
            Tree brzoza = new Tree();  // stworzenie drzewa
            brzoza.Add(7);    // dodawanie elementów do drzewa
            brzoza.Add(12);
            brzoza.Add(4);
            brzoza.Add(1);
            brzoza.Add(8);
            brzoza.Add(12);
            brzoza.Add(63);
            brzoza.Add(2);

            Console.WriteLine("Drzewo posiada {0} elementów", brzoza.Count());

            brzoza.Display();  // wyświetlenie całego drzewa
            Console.WriteLine();

            Console.WriteLine("Czy w drzewie znajduje się liczba 4?");
            Console.WriteLine(brzoza.Search(4));

            Console.WriteLine("Czy w drzewie znajduje się liczba 23?");
            Console.WriteLine(brzoza.Search(23));

            brzoza.Add(23);

            Console.WriteLine("Czy w drzewie znajduje się liczba 23?");
            Console.WriteLine(brzoza.Search(23));

            Console.ReadKey();
        }
    }
}
</pre>

&nbsp;

## [Pobierz drzewo w PDF][2]

 [1]: https://youtu.be/_V7a1Gwuj5k?t=37m46s
 [2]: http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/drzewo.pdf