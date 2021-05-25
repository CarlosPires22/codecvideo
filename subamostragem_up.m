function struct_RGB = subamostragem_up (struct_Ycbcr,taxa)
  
  struct_RGB(length(struct_Ycbcr)) = struct('imagem',[]);
  
  for k=1:length(struct_Ycbcr)
y1 = struct_Ycbcr(k).y;
cb1 = struct_Ycbcr(k).cb;
cr1= struct_Ycbcr(k).cr;


  %Upscalling Cb
  linhas = size(cb1,1);
  colunas = size(cb1,2);
  
  cb_up = zeros(linhas*taxa,colunas*taxa);
  
j = 1;
for i=1:taxa:taxa^2
lin(i:i+taxa-1) = j;
col(i:i+taxa-1) = 1:taxa;
j = j+1;

end

for i = 1:length(lin)
cb_up(lin(i):taxa:end,col(i):taxa:end) = cb1;
end
  
  
 %Upscalling Cr
  linhas = size(cr1,1);
  colunas = size(cr1,2);
  
  cr_up = zeros(linhas*taxa,colunas*taxa);
  
j = 1;
for i=1:taxa:taxa^2
lin(i:i+taxa-1) = j;
col(i:i+taxa-1) = 1:taxa;
j = j+1;

end

for i = 1:length(lin)
cr_up(lin(i):taxa:end,col(i):taxa:end) = cr1;
end
 

% converte a imagem resultante para R, G, B
B2 = (cb_up-128)/0.564 + y1;
R2 = (cr_up-128)/0.713 + y1;
G2 = (y1 -0.114*B2 - 0.299*R2)/0.587;

%re3monta a imagem R, G, B
im_final(:,:,1) = R2;
im_final(:,:,2) = G2;
im_final(:,:,3) = B2;

struct_RGB(k).imagem = uint8(im_final);

end
end