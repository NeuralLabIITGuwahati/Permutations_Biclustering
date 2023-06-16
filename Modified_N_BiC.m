Vars.Start_c=1;
Vars.End_c=11;
Vars.Subs = 120;
Vars.Overlap = 0.8;
Vars.comp_req = 11;
Vars.ToS = 400;
Vars.Noc = 11;

msg = "Choose your Option";
opts = ["Custom Loading Matrix" "Simulated Matrix"];
choice = menu(msg,opts);
if choice==1 
A1 = M(71:250,:);
[Sor_Ext_final,Sor_Abs_final,Sor2_final,Sor_final] = Sort_load(A1,Vars.Noc,Vars.ToS);
R_Sort = Sor_final(:,Vars.Start_c:Vars.End_c);% Sorted Matrix After running
%dispmat(R_Sort,'Components','Subjects','Sorted Matrix Showing Biclusters')
[BicMat,AvMSR,Bics] = Search_BICS(Sor_Ext_final,Vars);
dispmat(BicMat,'Components','Subjects','Matrix Showing Possible Biclusters');
end
if choice==2

C1 = [1,2,3];
C2 = [4,5,6,7];    %Subjects and Components for BICs
C3 = [8,9,10,11];
S1 = 1:133;
S2 = 134:266;
S3 = 267:400;
Vars.Subjects = {S1,S2,S3};
Vars.Components = {C1,C2,C3};
Vars.Embedding = [10,-10,10];
[A1,ABics] = mat_create(Vars);
[Sor_Ext_final,Sor_Abs_final,Sor2_final,Sor_final] = Sort_load(A1,Vars.Noc,Vars.ToS);
R_Sort = Sor_final(:,Vars.Start_c:Vars.End_c);% Sorted Matrix After running
dispmat(R_Sort,'Components','Subjects','Sorted Matrix Showing Biclusters')
[BicMat,AvMSR,Bics] = Search_BICS_sim(Sor_Ext_final,Vars,ABics);
dispmat(BicMat,'Components','Subjects','Matrix Showing Possible Biclusters');
end