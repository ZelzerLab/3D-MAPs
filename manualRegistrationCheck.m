clear all 


% pt_data_path={'Nuclei_and_Cells_PT_S17_m2_wt/','Nuclei_and_Cells_PT_S84_m3_wt/','Nuclei_and_Cells_PT_S18_m2_mut/',...
%            'Nuclei_and_Cells_PT_S17_m1_mut/', 'Nuclei_and_Cells_PT_S84_m1_mut/', 'Nuclei_and_Cells_PT_S84_m5_mut/' ,...
%            'Nuclei_and_Cells_PT_S18_m6_wt/', 'Nuclei_and_Cells_PT_S51_m2_wt/', 'Nuclei_and_Cells_PT_S84_m4_wt/'  };
% 
%        
% dt_data_path={'Nuclei_and_Cells_DT_S17_m2_wt/','Nuclei_and_Cells_DT_S84_m3_wt/','Nuclei_and_Cells_DT_S18_m2_mut/',...
%            'Nuclei_and_Cells_DT_S17_m1_mut/', 'Nuclei_and_Cells_DT_S84_m1_mut/', 'Nuclei_and_Cells_DT_S84_m5_mut/' ,...
%            'Nuclei_and_Cells_DT_S18_m6_wt/', 'Nuclei_and_Cells_DT_S51_m2_wt/', 'Nuclei_and_Cells_DT_S84_m4_wt/'  };



dt_data_path={  'data\Nuclei_and_Cells_DU_S96_m1_het\', 'data\Nuclei_and_Cells_DU_S96_m3_mut\'};
legendname={'m1 het', 'm2 mut','S18 m2 mt', 'S17 m1 mt','S84 m1 mut','S84 m5 mt','S18 m6 wt','S51 m2 wt','S84 m4 wt'};
mycolor={'r*','b*','g*','m*','c*','k*','y*'};



bigvec{1}=[1.1798e-17	-1.0053e-17	1
-0.76114	0.64859	1.55e-17
0.64859	0.76114	0];

bigvec{2}=[-2.299e-17	6.3439e-18	1
-0.96397	0.266	-2.3849e-17
-0.266	-0.96397	0];



h1=figure;
count=1;
for i=[length(dt_data_path)];%put all the bone here one by one to check alignment with sample 1 
    data=load([dt_data_path{i},'AlignedXYZ.mat']);
    vec=bigvec{i};
    V=[data.alphaShapeAll];
    
    
    %The angle of rotation are chosen manually to visualize the bone that
    %they both are aligned together 
    if i==1
         %Rotation should done only for required sample 
         vec=vec*RotationMatrix_X(pi)*RotationMatrix_Y(pi);
    end

    if i==2 
         vec=vec*RotationMatrix_Z(pi)*RotationMatrix_Y(pi);
    end
    
    if i==3
         vec=vec*RotationMatrix_Z(180/180*pi)*RotationMatrix_X(0/180*pi);
    end
    
    if i==4
         vec=vec*RotationMatrix_Z(0/180*pi)*RotationMatrix_X(180/180*pi);
    end
    
    if i==5
          vec=vec*RotationMatrix_Z(180/180*pi)*RotationMatrix_X(pi);
    end
    
    if i==6
         vec=vec*RotationMatrix_Z(0/180*pi)*RotationMatrix_X(0/180*pi);
    end
    
    if i==7
         vec=vec*RotationMatrix_Z(180/180*pi)*RotationMatrix_X(0/180*pi);
    end
    
    if i==8
         vec=vec*RotationMatrix_Z(0/180*pi)*RotationMatrix_X(0/180*pi);
    end
    
    if i==9
         vec=vec*RotationMatrix_Z(0/180*pi)*RotationMatrix_X(0/180*pi);
    end
    
    
    V=V*vec;
    p(count)=plot3(V(:,1),V(:,2),V(:,3),mycolor{count},'markersize',2);
    hold on ;
    legendarray{count}=legendname{i};
    count=count+1;
    
  
    s=strsplit(dt_data_path{i},'Nuclei_and_Cells_');
    dlmwrite(strcat(s{2}(1:strlength(s{2})-1),'Alignment_matrix.dat'),vec,'\t');
end
    
legend(p,legendarray,'location','northeast');
   
    
xlabel('x')
ylabel('y')
zlabel('z')
axis image
view(42,11)



function R=RotationMatrix_Z(theta)
         R=[cos(theta) -sin(theta) 0;
            sin(theta) cos(theta) 0;
            0 0 1];
end



function R=RotationMatrix_X(theta)
         R=[1 0 0;
            0 cos(theta) -sin(theta);
            0 sin(theta) cos(theta)];
end

function R=RotationMatrix_Y(theta)
         R=[cos(theta) 0 sin(theta);
             0  1  0;
            -sin(theta) 0 cos(theta)];
end


