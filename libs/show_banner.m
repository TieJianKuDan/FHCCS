function show_banner()
    banner = fopen("banner" + num2str(mod(int32(rand(1)*655359983), 6)) + ".txt",'r');  
    while 1
        line = fgetl(banner);
        if line == -1
            break
        else
            disp(line)
        end
    end 
    fclose(banner);
end








 
 






                                                                                                                                       