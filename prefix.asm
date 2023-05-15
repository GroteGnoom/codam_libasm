%ifidn __OUTPUT_FORMAT__, macho64
    %define PREFIX _
%else
    %define PREFIX
%endif
