function [ length1,length2,beta1,beta2,theta1,theta2 ] = my_crossfinder( alpha1,alpha2,h )
%寻找不同角度的交点
%   
    Rx_dist=16;%发射天线间距 λ cm
    threshold_dist=0.1;%寻找交点的误差  λ cm
    alpha1=alpha1*pi/180;
    alpha2=alpha2*pi/180;
    flag_left=0;
    for beta1 = 0:0.01:alpha1
        for theta1 = 0:0.01:alpha2
            d_left = h/tan(alpha2-theta1)-h/tan(alpha1-beta1);
            if abs(d_left-Rx_dist)<=threshold_dist
                flag_left=1;
                break;
            end
        end
        if flag_left ==1
            break;
        end
    end
    flag_right=0;
    for beta2 = 0:0.01:alpha1
        for theta2 = 0:0.01:alpha2
            d_right = h/tan(alpha2+theta2)-h/tan(alpha1+beta2);
            if abs(d_right-Rx_dist)<=threshold_dist
                flag_right=1;
                break;
            end
        end
        if flag_right ==1
            break;
        end
    end
    a1=h/sin(alpha1-beta1);
    b1=h/sin(alpha1+beta2);
    length1=sqrt(a1^2+b1^2-2*a1*b1*cos(beta1+beta2));
    a2=h/sin(alpha2-theta1);
    b2=h/sin(alpha2+theta2);
    length2=sqrt(a2^2+b2^2-2*a2*b2*cos(theta1+theta2));
    
    theta1=theta1*180/pi;
    beta1=beta1*180/pi;
    theta2=theta2*180/pi;
    beta2=beta2*180/pi;

end

