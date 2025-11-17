Tech = 1/1000;               
t = 0:Tech:2;                
s = sin(2*pi*10*t);          
N = size(s,2);               

figure                       
plot(t,s); 
xlabel('Temps (s)') 
ylabel('Signal sinus') 
grid 

Nfft = 2^nextpow2(N);        
S = fft(s,Nfft)/N; 
f = linspace(0,1,Nfft/2+1)/(2*Tech); 
S_ampli = 2*abs(S(1:Nfft/2+1));    
figure                        
plot(f,S_ampli)             
ylabel('Amplitude') 
xlabel('Fréquence (Hz)') 
grid
