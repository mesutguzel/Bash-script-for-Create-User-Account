#!/bin/bash
#a bash script created with a while loop, to ask user to create account, delete account, change group, change login, change expiration or to quit 

displayMenu=n     #initalizing displayMenu to null value 
while [ $displayMenu != "Q" ] || [ $displayMenu != "q" ]; #while loop created, this will display menu until user wants to quit (q selected)
do 
    clear
    echo "Choose one of the following options:" #displaying menu from A to Q
    echo  -e "A to Create a user account\nB to Delete a user account\nC to change Supplementary Group for a user account\nD to change Initial Group for a user account\nE to Change default login shell for a user account\nF to change account expiration date for a user account\nQ to Quit\nWhat would you like to do?"
    
    read displayMenu #assigning the selected option to variable
    echo "You Entered $displayMenu" #this will show the user selected option menu
    sleep 3 #3 sec wait
    
    
    if [ $displayMenu == "A" ] || [ $displayMenu == "a" ]
    #A will create user account, with home directory and shell preference
    then 
        echo -n "Enter username: " ; read username
        echo -n "User's home directory (absoulate path): " ; read directory
        echo -n "Default login shell (only shell name): " ; read loginShell
        sudo useradd -d $directory -s /bin/$loginShell $username
        echo "$username  account created"
        sleep 3 #3 sec wait
    
    #B will delete user account which created in A option
    elif [ $displayMenu == "B" ] || [ $displayMenu == "b" ]
    
    then 
        sudo userdel -f $username
        echo "$username User account deleted"
        sleep 3 #3 sec wait
     
    #C will change suplementary group name   
    elif [ $displayMenu == "C" ] || [ $displayMenu == "c" ]
    
    then 
         echo -n "Enter group name: " ; read group
            sudo usermod -G $group $username
            echo "Supplementary group changed to $group"
            sleep 3 #3 sec wait
    
    #D will change primary group name
    elif [ $displayMenu == "D" ] || [ $displayMenu == "d" ]
    
     then 
        echo -n "Enter primary group name: " ; read pgName
        sudo usermod -g $pgName $username
        echo "New initial group name : $pgName"
        sleep 3 #3 sec wait
    
    #E will ask for shell selection
    elif [ $displayMenu == "E" ] || [ $displayMenu == "e" ]
    
    then 
        echo -n "Enter shell selection: " ; read shell
        sudo usermod -s /bin/$shell $username
        echo "Default shell is $shell"
       sleep 3 #3 sec wait
        
    #F will change expiration date
    elif [ $displayMenu == "F" ] || [ $displayMenu == "f" ]
    
    then 
        echo "Enter expiration date YYYY-MM-DD: " ; read date
        sudo usermod -e $date $username
        echo "Expiration date will be $date"
        sleep 3 #3 sec wait
        
    #Q will quit from the script    
    elif [ $displayMenu == "Q" ] || [ $displayMenu == "q" ]
    
    then 
        break
    
    #if user will select any invalid option this will appear    
    else 
        echo -e "Invalid option selected\nPlease try again"
        sleep 3 #3 sec wait
    fi
    
done

echo "Bye Bye :(" #script be like "don't let me go"
