%% 1.	Napisać skrypt realizujący wyświetlanie we współrzędnych
% 3D rozkładu składowych barw RGB (przy zachowaniu odpowiedniej
% kolorystyki). *Dokonać uproszczenia polegającego na wprowadzeniu 
% płaszczyzny kryterialnej o danej wartości (Z – nasycenie) redukującą 
% pewne wartości nasycenia poszczególnych składowych barwy RGB.  

clc
clear all
close all

[obrazRGB] = imread('picture1.jpg'); 
obrazR = obrazRGB(:,:,1);
obrazG = obrazRGB(:,:,2);
obrazB = obrazRGB(:,:,3);

[w, k, ~] = size(obrazRGB);

figure()
imshow(obrazRGB)
%%
% Dostosowanie rozmiaru tła
f = gcf;
f.PaperSize = [f.PaperPosition(3) f.PaperPosition(4)];

% Zapisanie figury jako plik PDF
print(f, '-dpdf', 'my_figure1.pdf');
%%
% czerwony
r=0:1:255;             	
rr=r';			
z=zeros(256,3);		
z(:,1)=rr;	
red=z/255;			
% zielony
r2=0:1:255;
rr2=r2';
z2=zeros(256,3);
z2(:,2)=rr2;
green=z2/255;
% niebieski
r3=0:1:255;
rr3=r3';
z3=zeros(256,3);
z3(:,3)=rr3;
blue=z3/255;

% Wartość nasycenia do osiągnięcia (Z)
Z = 90;

% Zmniejszenie nasycenia dla poszczególnych kanałów barwy
obrazR_redukowany = obrazR * (Z/255);
obrazG_redukowany = obrazG * (Z/255);
obrazB_redukowany = obrazB * (Z/255);

figure()
mesh(1:k, w:-1:1, obrazR_redukowany, 'FaceColor', 'texturemap', 'EdgeColor', 'none', 'CdataMapping', 'direct');
colormap(red)
view([-15 70]);
colorbar('vert');
title('Wykres przestrzenny - kanał czerwony (zredukowany)');
xlabel('Kolumna'); ylabel('Wiersz'); zlabel('Natężenie');
%%
% Dostosowanie rozmiaru tła
f = gcf;
f.PaperSize = [f.PaperPosition(3) f.PaperPosition(4)];

% Zapisanie figury jako plik PDF
print(f, '-dpdf', 'my_figure2.pdf');
%%

figure()
surf(1:k, w:-1:1, obrazG_redukowany, 'FaceColor', 'texturemap', 'EdgeColor', 'none', 'CdataMapping', 'direct');
colormap(green)
view([-15 70]);
colorbar('vert');
title('Wykres przestrzenny - kanał zielony (zredukowany)');
xlabel('Kolumna'); ylabel('Wiersz'); zlabel('Natężenie');
%%
% Dostosowanie rozmiaru tła
f = gcf;
f.PaperSize = [f.PaperPosition(3) f.PaperPosition(4)];

% Zapisanie figury jako plik PDF
print(f, '-dpdf', 'my_figure3.pdf');
%%

figure()
mesh(1:k, w:-1:1, obrazB_redukowany, 'FaceColor', 'texturemap', 'EdgeColor', 'none', 'CdataMapping', 'direct');
colormap(blue)
view([-15 70]);
colorbar('vert');
title('Wykres przestrzenny - kanał niebieski (zredukowany)');
xlabel('Kolumna'); ylabel('Wiersz'); zlabel('Natężenie');
%%
% Dostosowanie rozmiaru tła
f = gcf;
f.PaperSize = [f.PaperPosition(3) f.PaperPosition(4)];

% Zapisanie figury jako plik PDF
print(f, '-dpdf', 'my_figure4.pdf');
%%

%% 2.	Dla jednego, wybranego obrazu RGB dokonać konwersji do 3 wybranych innych 
% reprezentacji barwnych. Wyniki w postaci obrazów umieścić w sprawozdaniu. Scharakteryzować 
% dla każdego modelu barwnego rodzaj pozyskiwanej informacji barwnej. 

% Konwersja na przestrzeń barwną HSV
obrazHSV = rgb2hsv(obrazRGB);

% Konwersja na przestrzeń barwną Lab
obrazLab = rgb2lab(obrazRGB);

% Konwersja na przestrzeń barwną YCbCr
obrazYCbCr = rgb2ycbcr(obrazRGB);

% Wyświetlanie obrazów w trzech różnych reprezentacjach barwnych
figure()
imshow(obrazRGB)
title('Obraz RGB')
%%
% Dostosowanie rozmiaru tła
f = gcf;
f.PaperSize = [f.PaperPosition(3) f.PaperPosition(4)];

% Zapisanie figury jako plik PDF
print(f, '-dpdf', 'my_figure5.pdf');
%%

figure()
imshow(obrazHSV)
title('Obraz w przestrzeni barwnej HSV')
xlabel('Odcień'); ylabel('Nasycenie'); zlabel('Wartość')
%%
% Dostosowanie rozmiaru tła
f = gcf;
f.PaperSize = [f.PaperPosition(3) f.PaperPosition(4)];

% Zapisanie figury jako plik PDF
print(f, '-dpdf', 'my_figure6.pdf');
%%

figure()
imshow(obrazLab)
title('Obraz w przestrzeni barwnej Lab')
xlabel('Jasność'); ylabel('a'); zlabel('b')
%%
% Dostosowanie rozmiaru tła
f = gcf;
f.PaperSize = [f.PaperPosition(3) f.PaperPosition(4)];

% Zapisanie figury jako plik PDF
print(f, '-dpdf', 'my_figure7.pdf');
%%
figure()
imshow(obrazYCbCr)
title('Obraz w przestrzeni barwnej YCbCr')
xlabel('Luminancja'); ylabel('Chrominancja Cb'); zlabel('Chrominancja Cr')
%%
% Dostosowanie rozmiaru tła
f = gcf;
f.PaperSize = [f.PaperPosition(3) f.PaperPosition(4)];

% Zapisanie figury jako plik PDF
print(f, '-dpdf', 'my_figure8.pdf');
%%
%% 3.	Dla dowolnego obraz barwnego:  
%a)	dokonać konwersji do obrazu w odcieniach szarości (rgb2gray)  

% Konwersja na obraz w odcieniach szarości
obrazGray = rgb2gray(obrazRGB);

% Wyświetlanie obrazów
figure()
imshow(obrazRGB)
title('Obraz barwny')
%%
% Dostosowanie rozmiaru tła
f = gcf;
f.PaperSize = [f.PaperPosition(3) f.PaperPosition(4)];

% Zapisanie figury jako plik PDF
print(f, '-dpdf', 'my_figure9.pdf');
%%
figure()
imshow(obrazGray)
title('Obraz w odcieniach szarości')
%%
% Dostosowanie rozmiaru tła
f = gcf;
f.PaperSize = [f.PaperPosition(3) f.PaperPosition(4)];

% Zapisanie figury jako plik PDF
print(f, '-dpdf', 'my_figure10.pdf');
%%
%% b)	wyświetlić profil barwny RGB dla wybranego obiektu/fragmentu obrazu;    

% Wyświetlanie obrazu
figure()
imshow(obrazRGB)
title('Obraz barwny')
%%
% Dostosowanie rozmiaru tła
f = gcf;
f.PaperSize = [f.PaperPosition(3) f.PaperPosition(4)];

% Zapisanie figury jako plik PDF
print(f, '-dpdf', 'my_figure11.pdf');
%%

% Wybór obszaru zainteresowania
h = imrect; % Narzędzie do wyboru obszaru prostokątnego
position = wait(h);
x = round(position(1));
y = round(position(2));
width = round(position(3));
height = round(position(4));

% Wyodrębnienie obszaru zainteresowania
obszarZainteresowania = obrazRGB(y:y+height-1, x:x+width-1, :);

% Obliczenie średnich wartości dla każdego kanału barwnego
sredniaR = mean(mean(obszarZainteresowania(:,:,1)));
sredniaG = mean(mean(obszarZainteresowania(:,:,2)));
sredniaB = mean(mean(obszarZainteresowania(:,:,3)));

% Wyświetlanie profilu barwnego RGB
figure()
plot([1, 2, 3], [sredniaR, sredniaG, sredniaB], 'o-', 'LineWidth', 2)
title('Profil barwny RGB dla wybranego obiektu')
xlabel('Kanał barwny')
ylabel('Średnia wartość piksela')
set(gca, 'XTick', [1, 2, 3], 'XTickLabel', {'R', 'G', 'B'})
grid on
%%
% Dostosowanie rozmiaru tła
f = gcf;
f.PaperSize = [f.PaperPosition(3) f.PaperPosition(4)];

% Zapisanie figury jako plik PDF
print(f, '-dpdf', 'my_figure12.pdf');
%%
%% c)	zmodyfikować wybrany kanał barwny (np. poprzez odjęcie, dodanie, mnożenie itd. 
% elementów w  macierzy),  a  następnie  za  pomocą  funkcji  cat  scalić  macierze; wyświetlić obraz;  

% Wybrany kanał barwny (np. czerwony - R)
kanal = obrazRGB(:,:,1);

% Modyfikacja kanału barwnego (np. dodanie wartości)
modyfikacja = kanal + 150;

% Scalenie macierzy
obrazModyfikowany = cat(3, modyfikacja, obrazRGB(:,:,2), obrazRGB(:,:,3));

% Wyświetlanie obrazu
figure()
imshow(obrazRGB)
title('Obraz oryginalny')
%%
% Dostosowanie rozmiaru tła
f = gcf;
f.PaperSize = [f.PaperPosition(3) f.PaperPosition(4)];

% Zapisanie figury jako plik PDF
print(f, '-dpdf', 'my_figure13.pdf');
%%
figure()
imshow(obrazModyfikowany)
title('Obraz po modyfikacji')
%%
% Dostosowanie rozmiaru tła
f = gcf;
f.PaperSize = [f.PaperPosition(3) f.PaperPosition(4)];

% Zapisanie figury jako plik PDF
print(f, '-dpdf', 'my_figure14.pdf');
%%
%% d)	dokonać pseudokolorowania (2 przypadki) dla 2 wartości: 64, 255 kolorów; 

% Konwersja obrazu do obrazu w odcieniach szarości
obrazSzary = rgb2gray(obrazRGB);

% Pseudokolorowanie dla 64 kolorów
mapaKolorow64 = parula(64); % Wybór mapy kolorów (np. parula)
obrazPseudokolor64 = ind2rgb(obrazSzary, mapaKolorow64);

% Pseudokolorowanie dla 255 kolorów
mapaKolorow255 = parula(255); % Wybór mapy kolorów (np. parula)
obrazPseudokolor255 = ind2rgb(obrazSzary, mapaKolorow255);

% Pseudokolorowanie dla 64 kolorów
mapaKolorow64 = jet(64); % Wybór mapy kolorów (np. jet)
obrazPseudokolor64_2 = ind2rgb(obrazSzary, mapaKolorow64);

% Pseudokolorowanie dla 255 kolorów
mapaKolorow255 = jet(255); % Wybór mapy kolorów (np. jet)
obrazPseudokolor255_2 = ind2rgb(obrazSzary, mapaKolorow255);

% Wyświetlanie obrazów
% Wyświetlanie obrazów
figure()
subplot(2, 3, 1)
imshow(obrazSzary)
title('Obraz w odcieniach szarości')

subplot(2, 3, 2)
imshow(obrazPseudokolor64)
title('Pseudokolorowanie - 64 kolory (parula)')

subplot(2, 3, 3)
imshow(obrazPseudokolor255)
title('Pseudokolorowanie - 255 kolorów (parula)')

subplot(2, 3, 4)
imshow(obrazPseudokolor64_2)
title('Pseudokolorowanie - 64 kolory (jet)')

subplot(2, 3, 5)
imshow(obrazPseudokolor255_2)
title('Pseudokolorowanie - 255 kolorów (jet)')
subplot(2, 3, 6)
imshow(obrazRGB)
title('Obraz w odcieniach RGB')
%%
% Dostosowanie rozmiaru tła
f = gcf;
f.PaperSize = [f.PaperPosition(3) f.PaperPosition(4)];

% Zapisanie figury jako plik PDF
print(f, '-dpdf', 'my_figure15.pdf');
%%
%% e)	* wyodrębnić na obrazie wybrany kolor. 


[obrazRGB] = imread('picture1.jpg');

% Konwersja obrazu do obrazu w odcieniach szarości
obrazSzary = rgb2gray(obrazRGB);

% Wyodrębnienie koloru czerwonego
progR = 150; % Dolny próg dla składowej R
progG = 0;   % Dolny próg dla składowej G
progB = 0;   % Dolny próg dla składowej B

% Utworzenie maski dla koloru czerwonego
maskaCzerwony = (obrazRGB(:,:,1) > progR) & (obrazRGB(:,:,2) > progG) & (obrazRGB(:,:,3) > progB);

% Wyodrębnienie koloru czerwonego na obrazie
obrazWyodrebniony = obrazRGB;
obrazWyodrebniony(repmat(~maskaCzerwony,[1,1,3])) = 0;

% Wyświetlanie obrazów
figure()
subplot(1, 2, 1)
imshow(obrazRGB)
title('Obraz oryginalny')

subplot(1, 2, 2)
imshow(obrazWyodrebniony)
title('Wyodrębniony kolor czerwony')
%%
% Dostosowanie rozmiaru tła
f = gcf;
f.PaperSize = [f.PaperPosition(3) f.PaperPosition(4)];

% Zapisanie figury jako plik PDF
print(f, '-dpdf', 'my_figure16.pdf');
%%
%% 4.	*Zmodyfikować kontrast dowolnego obrazu (funkcja imaddjust). 
% Sprawdzić różne wartości parametrów tej funkcji.  Dla wybranego przypadku porównać
% histogramy barw przed korekcją i po korekcji gamma.
% Konwersja obrazu do obrazu w odcieniach szarości
obrazSzary = rgb2gray(obrazRGB);

% Wyświetlenie obrazu przed regulacją kontrastu
figure()
subplot(1, 3, 1)
imshow(obrazSzary)
title('Obraz przed regulacją kontrastu')

% Regulacja kontrastu dla różnych wartości parametrów
low_in = 0.2;  % Dolne ograniczenie dla wartości wejściowych
high_in = 0.8; % Górne ograniczenie dla wartości wejściowych
low_out = 0;   % Dolne ograniczenie dla wartości wyjściowych
high_out = 1;  % Górne ograniczenie dla wartości wyjściowych

obrazSkorygowany1 = imadjust(obrazSzary, [low_in high_in], [low_out high_out]);

low_in = 0.4;  % Dolne ograniczenie dla wartości wejściowych
high_in = 0.6; % Górne ograniczenie dla wartości wejściowych

obrazSkorygowany2 = imadjust(obrazSzary, [low_in high_in], [low_out high_out]);

% Wyświetlenie obrazów po regulacji kontrastu
subplot(1, 3, 2)
imshow(obrazSkorygowany1)
title('Obrazy po regulacji kontrastu1')

subplot(1, 3, 3)
imshow(obrazSkorygowany2)
title('Obrazy po regulacji kontrastu2')

%%
% Dostosowanie rozmiaru tła
f = gcf;
f.PaperSize = [f.PaperPosition(3) f.PaperPosition(4)];

% Zapisanie figury jako plik PDF
print(f, '-dpdf', 'my_figure17.pdf');
%%
% Wyświetlenie histogramu przed korekcją
figure()
subplot(1, 2, 1)
imhist(obrazSzary)
title('Histogram przed korekcją')

% Korekcja gamma
gamma = 0.5; % Wartość gamma (dostosuj wg potrzeb)
obrazSkorygowany = imadjust(obrazSzary, [], [], gamma);

% Wyświetlenie histogramu po korekcji
subplot(1, 2, 2)
imhist(obrazSkorygowany)
title('Histogram po korekcji gamma')
%%
% Dostosowanie rozmiaru tła
f = gcf;
f.PaperSize = [f.PaperPosition(3) f.PaperPosition(4)];

% Zapisanie figury jako plik PDF
print(f, '-dpdf', 'my_figure18.pdf');
%%
% Wyświetlenie obrazów
figure()
subplot(1, 2, 1)
imshow(obrazSzary)
title('Obraz przed korekcją')

subplot(1, 2, 2)
imshow(obrazSkorygowany)
title('Obraz po korekcji gamma')
%%
% Dostosowanie rozmiaru tła
f = gcf;
f.PaperSize = [f.PaperPosition(3) f.PaperPosition(4)];

% Zapisanie figury jako plik PDF
print(f, '-dpdf', 'my_figure19.pdf');
%%
%% 5.	**Dokonać pomiaru różnicy kolorów z wykorzystaniem funkcji deltaE 
% oraz imcolordiff (można wykorzystać obraz lub jego fragment z
% punktu 3 oraz jego wersję zmodyfikowaną 3c).


% Obliczenie różnicy kolorów między obrazami
color_diff = imabsdiff(obrazRGB, obrazModyfikowany);
color_diff2 = deltaE (obrazRGB,obrazModyfikowany);

% Wyświetlenie różnicy kolorów
figure()
subplot(1, 2, 1)
imshow(color_diff);
title('Różnica kolorów(imabsdiff)');

subplot(1, 2, 2)
imshow(color_diff2);
title('Różnica kolorów(deltaE)');
%%
% Dostosowanie rozmiaru tła
f = gcf;
f.PaperSize = [f.PaperPosition(3) f.PaperPosition(4)];

% Zapisanie figury jako plik PDF
print(f, '-dpdf', 'my_figure20.pdf');
%%