VERSION 5.00
Begin VB.Form frmRunStatus 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "EnergyPlus Run Status"
   ClientHeight    =   3600
   ClientLeft      =   2760
   ClientTop       =   3750
   ClientWidth     =   13860
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3600
   ScaleWidth      =   13860
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.ListBox lstStatus 
      Height          =   2790
      Left            =   840
      TabIndex        =   2
      Top             =   120
      Width           =   12855
   End
   Begin VB.PictureBox Picture1 
      BorderStyle     =   0  'None
      Height          =   615
      Left            =   240
      Picture         =   "frmRunStatus.frx":0000
      ScaleHeight     =   615
      ScaleWidth      =   495
      TabIndex        =   1
      Top             =   120
      Width           =   495
   End
   Begin VB.CommandButton OKButton 
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   375
      Left            =   12480
      TabIndex        =   0
      Top             =   3120
      Width           =   1215
   End
End
Attribute VB_Name = "frmRunStatus"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit

Private Sub OKButton_Click()
Unload Me
End Sub
