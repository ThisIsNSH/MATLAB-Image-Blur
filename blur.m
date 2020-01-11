function im = blur(arr,times)
    for a = 1:times
        for row = 3:2:size(arr,1)-3
            for col = 3:2:size(arr,2)-3 
                arr = intensity(row,col,arr);
            end
        end
    end
    im = arr;
end

function x = intensity(i,j,arr)
    
    sum1=double(0);
    sum2=double(0);
    sum3=double(0);
    
    howmuch = 1;
    factor = (howmuch+howmuch+1)*(howmuch+howmuch+1);
    
    for a = i-howmuch:i+howmuch
        for b = j-howmuch:j+howmuch
            sum1=sum1+double(arr(a,b,1));
            sum2=sum2+double(arr(a,b,2));
            sum3=sum3+double(arr(a,b,3));
        end
    end
    
    sum1=fix(sum1/factor);
    sum2=fix(sum2/factor);
    sum3=fix(sum3/factor);
    
    for a = i-howmuch:i+howmuch
        for b = j-howmuch:j+howmuch
            arr(a,b,1) = sum1;
            arr(a,b,2) = sum2;
            arr(a,b,3) = sum3;    
        end
    end
    
    x = arr;
end