function back = mat2txt( file_Name, matrix ) 
fop = fopen( file_Name, 'wt' );
[M,N] = size(matrix);
for m = 1:M
    for n = 1:N
        fprintf( fop, ' %s', mat2str( matrix(m,n) ) );
    end
    fprintf(fop, '\n' );
end
back = fclose( fop ) ;
