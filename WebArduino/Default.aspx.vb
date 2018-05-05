Imports System.Data.SqlClient
Public Class WebForm1
    Inherits System.Web.UI.Page

    'Definiowanie polaczenie z baza SQL dla konkretnego serwera i dla konkretnej bazy danych
    Dim connection As New SqlConnection("Server= ALSCENTER\SQLEXPRESS; Database = ARDUINO2; Integrated Security = true")

    'Procedura uruchamiana przy zaladowaniu strony
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Ustawianie tesktu na wysrodkowany
        A0Val.Style("text-align") = "center"
        A1Val.Style("text-align") = "center"
        A2Val.Style("text-align") = "center"
        A3Val.Style("text-align") = "center"
        A4Val.Style("text-align") = "center"
        A5Val.Style("text-align") = "center"
    End Sub

    'Fomartowanie przycisków (zmiana koloru) w zależności od tekstu na nim
    Public Sub ChangeBtn(ByVal NameBtn As String)
        Dim Btn As Button = CType(FindControl(NameBtn), Button)

        If Btn.Text = "1" Then
            Btn.BackColor = System.Drawing.Color.Black
            Btn.ForeColor = System.Drawing.Color.White
        ElseIf Btn.Text = "0" Then
            Btn.BackColor = System.Drawing.SystemColors.ButtonFace
            Btn.ForeColor = System.Drawing.SystemColors.ControlText
        End If
    End Sub

    'Procedura dla wcisniecia przycisku (dla pinow Cyfrowych)
    Protected Sub Btn_Click(sender As Object, e As EventArgs) Handles D0Btn.Click, D1Btn.Click,
        D2Btn.Click, D3Btn.Click, D4Btn.Click, D5Btn.Click, D6Btn.Click, D7Btn.Click, D8Btn.Click,
        D9Btn.Click, D10Btn.Click, D11Btn.Click, D12Btn.Click, D13Btn.Click, DAllBtn.Click
        Dim Btn As Button = CType(sender, Button) 'Obiekt pomocny
        Dim Btn2 As Button = Nothing 'Drugi obiekt pomocny, gdyz uzywanie jednego obiektu przycisku do odczytu i zapisu powoduje konflikt
        Dim NrPin As Integer = Nothing 'Nr pinu dla ktorego sa przeprowadzane operacje
        Dim NrPins As Byte = Nothing 'Nr wszystkich pinow dla ktorych przeprowadzane sa operacje (w petli)
        Dim Val As Byte = Nothing 'Zmienna przechowujaca wartosc dla tesktu przyciskow oraz wpisu do bazy danych
        Dim All As Boolean = Nothing 'zmienna informujaca czy zapis bedzie do jednego czy wszystkich pinow

        If Btn.ID = "DAllBtn" Then 'W zaleznosci od wcisnietego przycisku nadaje wartosc zmiennej All
            All = True
        Else
            All = False
        End If

        If Btn.Text = "0" Then 'Zmienia wartosc wyswietlana na przycisku na przeciwna
            Btn.Text = "1"
        ElseIf Btn.Text = "1" Then
            Btn.Text = "0"
        End If

        Val = CInt(Btn.Text) 'Wartosc pobierana z przycisku wcisnietego

        If All = True Then 'Ilosc pinow na ktorych beda przeprowadzane operacje
            NrPins = 14 'Dla wszystkich
        Else
            NrPins = 1 'Dla jednego
        End If

        For i As Byte = 2 To NrPins - 1 'Petla dla ilosci pinow
            If All = True Then
                NrPin = i 'Jesli dla wszystkich to NrPin'u jest wartoscia dla petli
            Else
                NrPin = Replace(Replace(Btn.ID, "D", ""), "Btn", "") 'Jesli jeden to nr pobierany z ID przycisku
            End If

            Btn2 = CType(FindControl("D" & NrPin & "Btn"), Button) 'Pomocniczy obiekt typu przycisk
            Btn2.Text = Val 'Wartosc pomocniczego obiektu typu przycisk
            ChangeBtn("D" & NrPin & "Btn") 'Formatowanie przycisku

            connection.Open() 'Otwieranie polaczenia z baza SQL
            'Polecenie (command) dla aktualizacja danych w bazie SQL
            Dim cmd As New SqlCommand("Update ARDUINO2.dbo.DPin set Value = @Val where ID = @ID", connection)
            cmd.Parameters.Add("@Val", SqlDbType.Bit).Value = Val 'wartosc dodawana do tabeli 
            cmd.Parameters.Add("@ID", SqlDbType.Int).Value = NrPin 'Wartosc dla danego pinu
            cmd.ExecuteNonQuery() 'wykonywanie
            connection.Close() 'zamykanie polaczenia
        Next
    End Sub

    'Wczytywanie wartosc z bazy danych dla wybranej tabeli
    Public Function LoadFromDB(Pin As Byte, DBTable As String) As String 'DBTable: DPin dla Digital, APin dla Analog
        connection.Open()
        Dim cmd As New SqlCommand("Select Value from " & DBTable & " where ID = @ID", connection)
        cmd.Parameters.Add("@ID", SqlDbType.Int).Value = Pin 'Definija numeru wiersza w kolumnie ID
        Dim adapter As New SqlDataAdapter(cmd) 'Tworzenie adaptera pomocniczego
        Dim table As New DataTable() 'Tworzenie pomocniczej tabeli
        adapter.Fill(table) 'Wypelnianie tabeli wartosciami
        connection.Close() 'Zamykanie polaczenie z baza danych

        'W zaleznosci od rodzaju tabeli wartosci sa skalowane na volt'y i zaokraglana, badz przekazywane w orginalnej postaci
        If DBTable = "APin" Then '
            Return Math.Round((table.Rows(0)(0) * 5 / 1023), 2) 'skalowanie i zaokraglanie dla wartosci analogowych
        Else
            Return table.Rows(0)(0).ToString 'wartosc niesformatowana
        End If
    End Function

    'Procedura przeprowadzajaca operacje dla pojedynczego taktu timera
    Protected Sub Timer1_Tick(sender As Object, e As EventArgs) Handles Timer1.Tick

        'Dla Digital
        For i As Byte = 0 To 13
            Dim btnD As Button = CType(FindControl("D" & i & "Btn"), Button) 'Znajdowanie odpowiedniego przycisku
            btnD.Text = LoadFromDB(i, "DPin") 'Aktualizowanie tekst na przycisku wartoscia z bazy danych
            ChangeBtn("D" & i & "Btn") 'Formatowanie przycisku
        Next

        'Dla Analog
        For j As Byte = 0 To 5
            Dim TBoxA As TextBox = CType(FindControl("A" & j & "Val"), TextBox) 'Znajdowanie odpowiedniego pola tekstowego
            TBoxA.Text = LoadFromDB(j, "APin") 'Aktualizowanie pola tekstowego wartoscia z bazy danych
        Next
    End Sub
End Class