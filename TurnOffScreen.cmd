:: /////////////////////////////////////////////
:: Screen turning off utility
:: (C) LazzR 2019, F44 Red
:: /////////////////////////////////////////////
@echo off
powershell.exe -nop -exec bypass -w hidden -c "&{Add-Type -AssemblyName System.Windows.Forms;$WM_SYSCOMMAND = 0x112;$SC_MONITORPOWER = 0xF170;$SendMessageDefinition = '[DllImport(\"user32.dll\", CharSet = CharSet.Auto)]public static extern int SendMessage(IntPtr hWnd, int wMsg, IntPtr wParam, IntPtr lParam);';$User32 = Add-Type -MemberDefinition $SendMessageDefinition -Name 'User32' -Namespace 'Win32' -PassThru;$Form = New-Object system.Windows.Forms.Form;$User32::SendMessage($Form.Handle,$WM_SYSCOMMAND,$SC_MONITORPOWER,2);$Form.Close();}"
