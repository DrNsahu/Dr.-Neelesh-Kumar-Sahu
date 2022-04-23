%%OBJECTIVE FUNCTION%%
function funxz = fun(variable)
no_of_variable = 3;
%funxz = 28.61-0.0249*variable(1)-41.98*variable(2)-12.86*variable(3)+0.000006*variable(1)^2+65.97*variable(2)^2+2.328*variable(3)^2+0.033*(variable(1)*variable(2))+0.0035*(variable(1)*variable(3));
funxz = 2.53-0.001275*variable(1)+0.002*variable(2)+0.165*variable(3)+0.337*variable(2)^2+0.223*variable(3)^2-0.000055*(variable(1)*variable(2))-0.0001*(variable(1)*variable(3))+0.087*(variable(2)*variable(3));
end
