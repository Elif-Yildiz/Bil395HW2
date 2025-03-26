with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Strings.Unbounded.Text_IO;

procedure Calculator is
   Input : Unbounded_String;
   First, Second, Result : Float;
   Oper : Character;
   Valid_Input : Boolean;

begin
   loop
      Put("Enter expression (e.g., 5 + 3) or 'exit' to quit: ");
      Ada.Strings.Unbounded.Text_IO.Get_Line(Input);
      
      if To_String(Input) = "exit" then
         Put_Line("Goodbye!");
         exit;
      end if;
      
      declare
         Parts : constant String := To_String(Input);
         Space_1, Space_2 : Natural := 0;
      begin
         -- Boşlukları bul
         for I in 1 .. Parts'Length loop
            if Parts(I) = ' ' then
               if Space_1 = 0 then
                  Space_1 := I;
               else
                  Space_2 := I;
                  exit;
               end if;
            end if;
         end loop;
         
         -- Geçerli format kontrolü
         Valid_Input := (Space_1 /= 0) and (Space_2 /= 0);
         
         if not Valid_Input then
            Put_Line("Invalid input. Please enter in format: number operator number");
            Put_Line("");
         else
            -- Sayıları ve operatörü ayıkla
            begin
               First := Float'Value(Parts(1 .. Space_1 - 1));
               Oper := Parts(Space_1 + 1);
               Second := Float'Value(Parts(Space_2 + 1 .. Parts'Length));
            exception
               when others =>
                  Put_Line("Invalid input. Please enter valid numbers and operator.");
                  Put_Line("");
            end;
         
            -- İşlemi gerçekleştir
            case Oper is
               when '+' => Result := First + Second;
               when '-' => Result := First - Second;
               when '*' => Result := First * Second;
               when '/' =>
                  if Second = 0.0 then
                     Put_Line("Cannot divide by 0");
                     Put_Line("");
                  else
                     Result := First / Second;
                  end if;
               when others =>
                  Put_Line("Invalid operator: " & Oper);
                  Put_Line("");
            end case;
         
            Put_Line("Result: " & Float'Image(First) & " " & Oper & " " & Float'Image(Second) & " = " & Float'Image(Result));
            Put_Line("");
         end if;
      end;
   end loop;
end Calculator;
