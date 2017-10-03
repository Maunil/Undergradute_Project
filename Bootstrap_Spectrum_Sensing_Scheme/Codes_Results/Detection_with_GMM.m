clear;
clc;
%---------------------------------------------------------------
%Required parameter
M = 4;%Channel Info
L = 100;%Sample size
B1 = 30; %Repeat process
X = 9;%Number samples in bootstrapped set
B = 300;%Number of times detection procedure is repeated
alpha(1) = 0.001;
alpha(2) = 0.1;% false alarm probability
alpha(3) = 0.7;
%---------------------------------------------------------------
%
%---------------------------------------------------------------
%Process of generating signal y = h*s + n
%-------------------------------------------------------

%This are the Couter which will increment according to the condition which
%we taken in last 

h11=zeros(1,16);
h21=zeros(1,16);
h12=zeros(1,16);
h22=zeros(1,16);
h13=zeros(1,16);
h23=zeros(1,16);
%using Montecarlo Simulation method 
%-------------------------------------------------------------------------
for event=1:1000
Start=-20;
%-------------------------------------------------------------------------
            S_N = zeros(1,9);
            Gamma = zeros(1,9);
            %Primary Signal generation Process
            %--------------------------------------------------------------
      
                
                s = zeros(1,L); % For Primary signal samples are 100 
                for j=1:L
                    s(j) = complex(normrnd(0,1),normrnd(0,1));  %Complex Primary Signal (Normal Gaussian) 
                end
                %Channel Generation 
                %--------------------------------------------------------------
                h = complex(1,1);
                for i=1:4
                    chan = rayleighchan;       %Staic Fading channel 
                    h(i) = (chan.PathGains);   % Getting the Gain of the Channel
                end

                %disp (chan(1).PathGains);
                %disp (chan(2).PathGains);
                %disp (chan(3).PathGains);
                %disp (chan(4).PathGains);

                %Generalized Gaussian Model Noise
                %--------------------------------------------------------------
             
                mu1 = 0;      % Mean
                sigma1 = 1;    % Sigma
                m1 = 50;      % Number of points

                mu2 = 0;
                sigma2 = 3;
                m2 = 50;
               for k=1:4
                   X1 = (randn(m1, 1) * sigma1) + mu1;
                   X2 = (randn(m2, 1) * sigma2) + mu2;
                   n(k,:)= [X1; X2];
               end  

                %disp(n);

                
                
                
            %Detection Process 
            %--------------------------------------------------------------
            for a = 1:16 % This loop Determines the Different S_N Ratio 

                        S_N(a)=Start;

                        expo = power(10,(S_N(a)/10));  
                        
                        % Taking Two Condition 
                        if(event<1001)
                                 y = (transpose(h))*(s)*expo + n ; % This one signal for Hypothesis 1
                        else
                                 y = n;
                        end
                        %---------------------------------------------------------------------------------

                        p = transpose(y);

                        %Split the Received Signal according to Different
                        %Channel
                        First = p(1:100); %Signal of First Channel 

                        Second = p(101:200); %Signal of Second Channel 

                        Third = p(201:300); %Signal Of Third Channel 

                        Forth = p(301:400); % Signal of Forth Channel 

                        %Computing the Eigen Values  using sample covariance
                        %matirx 

                        %First took conjugate matrix
                            Y1 = conj(First);
                            Y2 = conj(Second);
                            Y3 = conj(Third);
                            Y4 = conj(Forth);

                            Samplecov1 = complex(0,0);
                            Samplecov2 = complex(0,0);
                            Samplecov3 = complex(0,0);
                            Samplecov4 = complex(0,0);

                            for sk=1:100
                                Samplecov1(sk) = (1/99)*(First(sk)*(transpose(Y1(sk))));
                                Samplecov2(sk) = (1/99)*(Second(sk)*(transpose(Y2(sk))));
                                Samplecov3(sk) = (1/99)*(Third(sk)*(transpose(Y3(sk))));
                                Samplecov4(sk) = (1/99)*(Forth(sk)*(transpose(Y4(sk))));
                            end

                            E(1) = sqrt(eig(Samplecov1*(transpose(Samplecov1)))); 
                            E(2) = sqrt(eig(Samplecov2*(transpose(Samplecov2))));
                            E(3) = sqrt(eig(Samplecov3*(transpose(Samplecov3))));
                            E(4) = sqrt(eig(Samplecov4*(transpose(Samplecov4))));
                            
                             E = sort(E);
                            Eigen1 = E(4);
                            Eigen2 = E(3);
                            Eigen3 = E(2);
                            Eigen4 = E(1);
                            
                            %disp('Eigen Values of Original Signal');
                            %disp(Eigen1);
                            %disp(Eigen2);
                            %disp(Eigen3);
                            %disp(Eigen4);
                            %----------------------------------------------
                        
                            
                           %Computing the Sample Eigen values 
                 
                            eigen1 = zeros(1,30);
                            eigen2 = zeros(1,30);
                            eigen3 = zeros(1,30);
                            eigen4 = zeros(1,30);


                        for e = 1:B1

                            %Bootstrap Samples i took 9 random samples and generated Y*  

                            Samples = randi(100,9); 
                            
                            bs = zeros(3,3);

                            for k=1:9
                                bs(k) = Samples(k:k);
                            end
                           
                            Bootstrapsample1 = zeros(1,9);
                            Bootstrapsample2 = zeros(1,9);
                            Bootstrapsample3 = zeros(1,9);
                            Bootstrapsample4 = zeros(1,9);

                            Boots1 = zeros(1,100);
                            Boots2 = zeros(1,100);
                            Boots3 = zeros(1,100);
                            Boots4 = zeros(1,100);
                            %Taking 9 random samples from channel signal
                            for p = 1:9
                                Bootstrapsample1(p)= First(bs(p));
                                Bootstrapsample2(p)= Second(bs(p));
                                Bootstrapsample3(p)= Third(bs(p));
                                Bootstrapsample4(p)= Forth(bs(p));
                            end
                            %Repeting those samples until we reach to 100
                            %resampling process.
                                to=0;
                                for sample = 1:11
                                    setv=1;
                                    while to<10
                                        Boots1(to+sample) = Bootstrapsample1(setv);    
                                        Boots2(to+sample) = Bootstrapsample2(setv);    
                                        Boots3(to+sample) = Bootstrapsample3(setv);    
                                        Boots4(to+sample) = Bootstrapsample4(setv);      
                                        to=to+1;
                                        if setv<9
                                          setv=setv+1;
                                        else 
                                            setv = 1;
                                        end
                                    end
                                end
                                    %Remaining Samples has been added  
                                    Boots1(100) = Bootstrapsample1(1);
                                    Boots2(100) = Bootstrapsample2(2);    
                                    Boots3(100) = Bootstrapsample3(3);    
                                    Boots4(100) = Bootstrapsample4(4);
                                    
                                    
                                    %Now we will collect the random ones from it 
                                    
                                    Samples1 = randi(100,9); 
                            
                                    bs1 = zeros(3,3);

                                    for k=1:9
                                        bs1(k) = Samples1(k:k);
                                    end
                                    
                                     sample11=zeros(1,9);
                                     sample22=zeros(1,9);
                                     sample33=zeros(1,9);
                                     sample44=zeros(1,9);
                                     
                                    %Taking 9 random samples from channel signal
                                    for p = 1:9
                                        sample11(p)= Boots1(bs1(p));
                                        sample22(p)= Boots2(bs1(p));
                                        sample33(p)= Boots3(bs1(p));
                                        sample44(p)= Boots4(bs1(p));
                                    end
                                    
                                    y1 = conj(sample11);
                                    y2 = conj(sample22);
                                    y3 = conj(sample33);
                                    y4 = conj(sample44);

                                    Samplecov11 = complex(0,0);
                                    Samplecov22 = complex(0,0);
                                    Samplecov33 = complex(0,0);
                                    Samplecov44 = complex(0,0);
                                    
                                    % Generating sample covariance matrix
                                    % using Boot strap samples
                                    for sk=1:9
                                        Samplecov11(sk) = (1/8)*(sample11(sk)*(transpose(y1(sk))));
                                        Samplecov22(sk) = (1/8)*(sample22(sk)*(transpose(y2(sk))));
                                        Samplecov33(sk) = (1/8)*(sample33(sk)*(transpose(y3(sk))));
                                        Samplecov44(sk) = (1/8)*(sample44(sk)*(transpose(y4(sk))));
                                    end

                                    %Computed the Eigen values from bootstrap samples 
                                    ei(1) = sqrt(eig(Samplecov11*(transpose(Samplecov11))));
                                    ei(2) = sqrt(eig(Samplecov22*(transpose(Samplecov22))));
                                    ei(3) = sqrt(eig(Samplecov33*(transpose(Samplecov33))));
                                    ei(4) = sqrt(eig(Samplecov44*(transpose(Samplecov44))));
                                    
                                    ei = sort(ei);
                                    eigen1(e) = ei(4);
                                    eigen2(e) = ei(3);
                                    eigen3(e) = ei(2);
                                    eigen4(e) = ei(1);
                                    
                        end 
                        %disp('Eigen Values of Sample Signal');
                        %disp(eigen1);
                        %disp(eigen2);
                        %disp(eigen3);
                        %disp(eigen4);


                        %Performaing Bias Correction Process 

                        sum1=0;
                        sum2=0;
                        sum3=0;
                        sum4=0;
                        for bi=1:B1
                              sum1 = (eigen1(bi)-Eigen1)+sum1;
                              sum2 = (eigen2(bi)-Eigen2)+sum2;
                              sum3 = (eigen3(bi)-Eigen3)+sum3;
                              sum4 = (eigen4(bi)-Eigen4)+sum4;
                        end
                           Bias1 = sum1/B1;   %Assumption B1 = 1/30
                           Bias2 = sum2/B1;   %Assumption B1 = 1/30
                           Bias3 = sum3/B1;   %Assumption B1 = 1/30
                           Bias4 = sum4/B1;   %Assumption B1 = 1/30

                        %Bias Reduced Sample Eigen Values 
                            Bias(1) = Eigen1 - Bias1;
                            Bias(2) = Eigen2 - Bias2;
                            Bias(3) = Eigen3 - Bias3;
                            Bias(4) = Eigen4 - Bias4;   
                            
                           % disp('Bias Result');
                           % disp(Bias(1));
                           % disp(Bias(2));
                           % disp(Bias(3));
                           % disp(Bias(4));
                            
                        %--------------------------------------------------------------------------------

                        sum = 0;
                        for i=2:M
                            sum = sum + Bias(i);
                        end

                        Main_Test_statistics = Bias(1) - (1/(M-1))*sum; % Main test statistics

                        %Start finding out test statistics for bootstrap sampled set by repeating
                        %process B times

                        New_Test_statistics = zeros(1,B); 

                        for i=1:B  
                                
                            
                                % Repeting the Sampe Bootstrap process as
                                % above
                                Samples = randi(100,9); 

                                bs = zeros(3,3);

                                for k=1:9
                                    bs(k) = Samples(k:k);
                                end

                                %This all Are Bootstrap samples  
                                Bootstrapsample1 = zeros(1,9);
                                Bootstrapsample2 = zeros(1,9);
                                Bootstrapsample3 = zeros(1,9);
                                Bootstrapsample4 = zeros(1,9);

                                %Replicas 
                                Boots1 = zeros(1,100);
                                Boots2 = zeros(1,100);
                                Boots3 = zeros(1,100);
                                Boots4 = zeros(1,100);

                                    for p = 1:9
                                        Bootstrapsample1(p)= First(bs(p));
                                        Bootstrapsample2(p)= Second(bs(p));
                                        Bootstrapsample3(p)= Third(bs(p));
                                        Bootstrapsample4(p)= Forth(bs(p));
                                    end

                                to=0;
                                for sample = 1:11
                                    setv=1;
                                    while to<10
                                        Boots1(to+sample) = Bootstrapsample1(setv);    
                                        Boots2(to+sample) = Bootstrapsample2(setv);    
                                        Boots3(to+sample) = Bootstrapsample3(setv);    
                                        Boots4(to+sample) = Bootstrapsample4(setv);      
                                        to=to+1;
                                        if setv<9
                                          setv=setv+1;
                                        else 
                                            setv = 1;
                                        end
                                    end
                                end
                                    %Remaining Samples has been added  
                                    Boots1(100) = Bootstrapsample1(1);
                                    Boots2(100) = Bootstrapsample2(2);    
                                    Boots3(100) = Bootstrapsample3(3);    
                                    Boots4(100) = Bootstrapsample4(4);      

                                    %Now taking the random values 
                                    Samples1 = randi(100,9); 
                                    
                                    bs1 = zeros(3,3);

                                    for k=1:9
                                        bs1(k) = Samples1(k:k);
                                    end
                                    
                                     sample11=zeros(1,9);
                                     sample22=zeros(1,9);
                                     sample33=zeros(1,9);
                                     sample44=zeros(1,9);
                                     
                                    %Taking 9 random samples from channel signal
                                    for p = 1:9
                                        sample11(p)= Boots1(bs1(p));
                                        sample22(p)= Boots2(bs1(p));
                                        sample33(p)= Boots3(bs1(p));
                                        sample44(p)= Boots4(bs1(p));
                                    end
                                                                         
                                    y1 = conj(sample11);
                                    y2 = conj(sample22);
                                    y3 = conj(sample33);
                                    y4 = conj(sample44);

                                    Samplecov11 = complex(0,0);
                                    Samplecov22 = complex(0,0);
                                    Samplecov33 = complex(0,0);
                                    Samplecov44 = complex(0,0);
                                    
                                    % Generating sample covariance matrix
                                    % using Boot strap samples
                                    for sk=1:9
                                        Samplecov11(sk) = (1/8)*(sample11(sk)*(transpose(y1(sk))));
                                        Samplecov22(sk) = (1/8)*(sample22(sk)*(transpose(y2(sk))));
                                        Samplecov33(sk) = (1/8)*(sample33(sk)*(transpose(y3(sk))));
                                        Samplecov44(sk) = (1/8)*(sample44(sk)*(transpose(y4(sk))));
                                    end       
                              
                                    %Computed the Eigen values 

                                    ei(1) = sqrt(eig(Samplecov11*(transpose(Samplecov11))));
                                    ei(2) = sqrt(eig(Samplecov22*(transpose(Samplecov22))));
                                    ei(3) = sqrt(eig(Samplecov33*(transpose(Samplecov33))));
                                    ei(4) = sqrt(eig(Samplecov44*(transpose(Samplecov44))));

                                    ei = sort(ei);
                                    eigen(1) = ei(4);
                                    eigen(2) = ei(3);
                                    eigen(3) = ei(2);
                                    eigen(4) = ei(1);
                                    
                                    sum = 0;
                                    for d=2:M
                                        sum = sum + eigen(d);
                                    end
                                    %Generating new test Statestic 
                                    New_Test_statistics(1,i) = (eigen(1) - (1/(M-1))*sum); % Test statistics for bootstrap sample set  
                                    New_Test_statistics = sort(New_Test_statistics);
                                    
                        end
                        
                        for al= 1:3
                            k =ceil((B)*(1 - alpha(al))); % Find out k from this equation
                            %Thresold
                            gamma(al) = New_Test_statistics(1,k) - Main_Test_statistics; % Threshold value
                        end
                       
                       % disp(gamma);
                        %disp(Main_Test_statistics);
                        
                        if Main_Test_statistics>=gamma(1)  
                            h11(a)=h11(a)+1;  
                        else 
                            h21(a)=h21(a)+1;
                        end
                        
                        if Main_Test_statistics>=gamma(2)
                            h12(a)=h12(a)+1;  
                        else 
                            h22(a)=h22(a)+1;
                        end
                        
                        if Main_Test_statistics>=gamma(3)  
                            h13(a)=h13(a)+1;  
                        else 
                            h23(a)=h23(a)+1;
                        end
                        
                       Start=Start+2;
            end
%-----------------------------------------------------------------------------
end

%disp(S_N);
% Computing the CDF 
%disp(S_N);
%disp(h1);
%plot(S_N,h1/1000)% Detection Probablity 

plot(S_N,(h11/1000),S_N,(h12/1000),S_N,(h13/1000))% Detection Probablity 


    
