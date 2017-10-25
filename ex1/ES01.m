%% Problem 1: Vector
% (Anm. Hatte Verständisprobleme bei Problem 1 [und somit auch bei 
% Problem 2], z.B. ob nur mit einem Vektor oder mit drei verschiedenen 
% gearbeitet werden soll, ob die Änderungen in den Vektor zurück 
% gespeichert werden sollen, etc. Deshalb lässt das Ergebnis ws. etwas zu 
% wünschen übrig.)

% Create a vector t with N values from ?2? to 2? for N = 8, 16, 512
t = linspace(-pi, pi, 8);
t = linspace(-pi, pi, 16);
t = linspace(-pi, pi, 512);

% Shift it by 4, 8, 256 positions to the left
t_shifted = circshift(t, -4);
t_shifted = circshift(t_shifted, -8);
t_shifted = circshift(t_shifted, -16);

% Transpose it
t_transposed = transpose(t);

% Concatenate t and the shifted version
% ... horizontally
t_concatenated_hor = [t t_shifted];

% ... vertically
t_concatenated_ver = [t; t_shifted];

%% Problem 2: SineWave
% Create a vector y with the same number of elements as t. Let the values 
% yi = sin(ti) with i = 1 . . . Nand plot y versus t for all values of N 
% in different colors in one plot

% Create original vectors for plotting
t1 = linspace(-pi, pi, 8);
t2 = linspace(-pi, pi, 16);
t3 = linspace(-pi, pi, 17);

% Create vectors holding sin values
y1 = sin(t1);
y2 = sin(t2);
y3 = sin(t3);

plot(t1, y1, 'r');
hold on;
plot(t2, y2, 'g');
hold on;
plot(t3, y3, 'b');

% Set all negative values vi in y to ?vi and display in a separate figure. 
% Use a logical array!
% (Anm.: Logical Index?)
y1(y1 < 0) = -y1(y1 < 0);
y2(y2 < 0) = -y2(y2 < 0);
y3(y3 < 0) = -y3(y3 < 0);

figure
plot(t1, y1)
hold on
plot(t2, y2)
hold on
plot(t3, y3)

%% Problem 3: Gauss 

% Visualization of gauss1d()
x = -10:0.2:10;
figure;
subplot(2, 2, 1);
plot(x, gauss1d(x, 1));
xlabel('sima = 1');
ylabel('gauss1d');
grid on;

subplot(2, 2, 2);
plot(x, gauss1d(x, 3));
xlabel('sima = 3');
ylabel('gauss1d');
grid on;

subplot(2, 2, 3);
plot(x, gauss1d(x, 6));
xlabel('sima = 6');
ylabel('gauss1d');
grid on;

subplot(2, 2, 4);
plot(x, gauss1d(x, 0.1));
xlabel('all together');
ylabel('gauss1d');
grid on;
hold on;
plot(x, gauss1d(x, 1));
hold on;
plot(x, gauss1d(x, 3));
hold on;
plot(x, gauss1d(x, 6));

%% Problem 4: Matrices
% Create random 100 x 100 matrix with integer values between 0 and 100
A = round(rand(100) * 100);

% Print sum of rows
fprintf('sum of row: %i\n', sum(A, 2));

% Print sum of colums
fprintf('sum of colum: %i\n', sum(A));

% Print mean of rows
fprintf('sum of row: %f\n', mean(A, 2));

% Print mean of colums
fprintf('sum of colum: %f\n', mean(A));

% Print count of values below a certain threshhold
threshhold = 50;
fprintf('values below %i: %i\n', threshhold, numel(A(A < threshhold)));

% Print mean of values below that threshhold
fprintf('mean of values below %i: %f\n', threshhold, mean(A(A < threshhold)));

% Substitute all values below a threshhold with a different value
A(A < threshhold) = 9999;

% Transpose the matrix
A = transpose(A);

% Reshape to a 2xn matrix
A = reshape(A, 2, []);

% Add random noise to the data
A = A + randi([10 20]);

% Create a neat plot of all calculated values
imagesc(A);
