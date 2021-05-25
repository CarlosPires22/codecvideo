# codecvideo
Subamostragem de Crominancia 
Código de subamostragem é uma função que vai tranformar uma imagem RGB para YCbCr e aplicar um downscalling no Cb e Cr, com intuito de comprimir o vídeo.

Código de DCT aplica a tranformada e quantização que sai da função subcrominancia e dividir pela tabela de quantização padrão jpeg. 

Código IDCT aplica a trasformada inversa e quantização

Função Subamostragem_up vai aplicar o upscalling e recuperar a imagem em RGB. 
