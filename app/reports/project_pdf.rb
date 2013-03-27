#!/usr/local/bin/ruby
# coding: utf-8
class ProjectPdf < Prawn::Document
  def initialize (project, view, user)
    super()      
    @project=project
    @view=view
    @user=user
    logo    
    metryczka(@project)
    spr_org(@project)
    kw_mer(@project)
    end               
  end
  
  def logo
    move_down 10
    logopath =  "#{Rails.root}/app/assets/images/logo.jpg"
    image logopath, :width => 655, :height => 122, :position=>:center, :vposition=>:top, :scale=>0.4
    move_down 20
  end


  def metryczka(project)
    move_down 15
    @project=project
    font "Helvetica"
    text "Metryczka", :size=>16, :align=>:center
    move_down 10
    font_size=9
    table ([["Nazwa projektu: ", "#{@project.name}"],
    ["Klient: ", "#{@project.client}"],
    ["Typ projektu: ", "#{@project.project_type}"],
    ["Numer ksiegowy: ", "#{@project.numer_ks}"],
    ["Highrise: ","#{@project.highrise}"],
    ["Skydrive: ","#{@project.skydrive}"],
    ["Basecamp: ","#{@project.basecamp}"]]), 
    :width => 500 do
      columns(0).align = :left
      columns(1).align = :left
      self.header = true
      self.column_widths = {0 => 200, 1 => 300}
      columns(0).font_style = :bold   
  end
  move_down 10
end

   def spr_org(project)
     move_down 15
    @project=project
    font "Helvetica"
    text "Sprawy organizacyjne", :size=>16, :align=>:center
    move_down 10
    font_size=9
    table ([["Ilosc uczestników: ", "#{@project.participant_count}"],
    ["Gra: ", "#{@project.game}"],
    ["Podzial na grupy: ", "#{@project.groups_division}"],
    ["Ilosc pokoi: ", "#{@project.number_of_rooms}"],
    ["Data gry: ","#{@project.date_of_game}"],
    ["Czas trwania: ","#{@project.hour_duration}"],
    ["Lokalizacja: ","#{@project.localization}"],
    ["Osoby kontaktowe od strony organizacyjnej (klient): ","#{@project.contacts_client}"],
    ["Osoby kontaktowe od strony organizacyjnej (hotel): ","#{@project.contacts_hotel}"],
    ["Szczególy dotyczace transportu:" ,"#{@project.transport_details}"],
    ["Zakwaterowanie: ","#{@project.accomodation}"]
    ]), 
    :width => 500 do
      columns(0).align = :left
      columns(1).align = :left
      self.header = true
      self.column_widths = {0 => 200, 1 => 300}
      columns(0).font_style = :bold   
  end
    move_down 10
end

def kw_mer(project)
  @project=project
  move_down 15
    text "Kwestie merytoryczne", :size=>16, :align=>:center
  move_down 10
    text  "Cel uzgodniony z klientem "+"#{@project.target_agreed_with_customer}", :size=>10, :align=>:center
  move_down 10
end

  def subscription_date
    move_down 40
    text "Subscription start date: 
    #{@invoice.start_date.strftime("%d/%m/%Y")} ", :size => 13
    move_down 20
    text "Subscription end date :  
    #{@invoice.end_date.strftime("%d/%m/%Y")}", :size => 13
  end

  def subscription_details
    move_down 40
    table subscription_item_rows, :width => 500 do
      row(0).font_style = :bold
      columns(1..3).align = :right
      self.header = true
      self.column_widths = {0 => 200, 1 => 100, 2 => 100, 3 => 100}
    end
  end


  def subscription_item_rows
    [["Description", "Quantity", "Rate", "Amount"]] +
    @invoice.subscriptions.map do |subscribe|
      [ "#{subscribe.description} ", subscribe.quantity, 
      "#{precision(subscribe.rate)}  ",  
      "#{precision(subscribe.quantity  * subscribe.rate)}" ]
    end
  end

  def precision(num)
    @view.number_with_precision(num, :precision => 2)
  end

  def regards_message
    move_down 50
    text "Thank You," ,:indent_paragraphs => 400
    move_down 6
    text "XYZ",
    :indent_paragraphs => 370, :size => 14, style:  :bold
  end
  
  def example_prawn
    Prawn::Document.generate("invoice.pdf") do |pdf|
  
  logopath = "#{Rails.root}/app/assets/images/logo.jpg"
  initial_y = pdf.cursor
  initialmove_y = 5
  address_x = 35
  invoice_header_x = 325
  lineheight_y = 12
  font_size = 9

  pdf.move_down initialmove_y

  # Add the font style and size
  pdf.font "Helvetica"
  pdf.font_size font_size

  #start with EON Media Group
  pdf.text_box "Your Business Name", :at => [address_x,  pdf.cursor]
  pdf.move_down lineheight_y
  pdf.text_box "1234 Some Street Suite 1703", :at => [address_x,  pdf.cursor]
  pdf.move_down lineheight_y
  pdf.text_box "Some City, ST 12345", :at => [address_x,  pdf.cursor]
  pdf.move_down lineheight_y

  last_measured_y = pdf.cursor
  pdf.move_cursor_to pdf.bounds.height

  pdf.image logopath, :width => 215, :position => :right

  pdf.move_cursor_to last_measured_y

  # client address
  pdf.move_down 65
  last_measured_y = pdf.cursor

  pdf.text_box "Client Business Name", :at => [address_x,  pdf.cursor]
  pdf.move_down lineheight_y
  pdf.text_box "Client Contact Name", :at => [address_x,  pdf.cursor]
  pdf.move_down lineheight_y
  pdf.text_box "4321 Some Street Suite 1000", :at => [address_x,  pdf.cursor]
  pdf.move_down lineheight_y
  pdf.text_box "Some City, ST 12345", :at => [address_x,  pdf.cursor]

  pdf.move_cursor_to last_measured_y

  invoice_header_data = [ 
    ["Invoice #", "001"],
    ["Invoice Date", "December 1, 2011"],
    ["Amount Due", "$3,200.00 USD"]
  ]

#:position => invoice_header_x,
  pdf.table(invoice_header_data,  :width => 215) do
    style(row(0..1).columns(0..1), :padding => [1, 5, 1, 5], :borders => [])
    style(row(2), :background_color => 'e9e9e9', :border_color => 'dddddd', :font_style => :bold)
    style(column(1), :align => :right)
    style(row(2).columns(0), :borders => [:top, :left, :bottom])
    style(row(2).columns(1), :borders => [:top, :right, :bottom])
  end

  pdf.move_down 45

  invoice_services_data = [ 
    ["Item", "Description", "Unit Cost", "Quantity", "Line Total"],
    ["Service Name", "Service Description", "320.00", "10", "$3,200.00"],
    [" ", " ", " ", " ", " "]
  ]

  pdf.table(invoice_services_data, :width => pdf.bounds.width) do
    style(row(1..-1).columns(0..-1), :padding => [4, 5, 4, 5], :borders => [:bottom], :border_color => 'dddddd')
    style(row(0), :background_color => 'e9e9e9', :border_color => 'dddddd', :font_style => :bold)
    style(row(0).columns(0..-1), :borders => [:top, :bottom])
    style(row(0).columns(0), :borders => [:top, :left, :bottom])
    style(row(0).columns(-1), :borders => [:top, :right, :bottom])
    style(row(-1), :border_width => 2)
    style(column(2..-1), :align => :right)
    style(columns(0), :width => 75)
    style(columns(1), :width => 275)
  end

  pdf.move_down 1

  invoice_services_totals_data = [ 
    ["Total", "$3,200.00"],
    ["Amount Paid", "-0.00"],
    ["Amount Due", "$3,200.00 USD"]
  ]

#:position => invoice_header_x,
  pdf.table(invoice_services_totals_data, :width => 215) do
    style(row(0..1).columns(0..1), :padding => [1, 5, 1, 5], :borders => [])
    style(row(0), :font_style => :bold)
    style(row(2), :background_color => 'e9e9e9', :border_color => 'dddddd', :font_style => :bold)
    style(column(1), :align => :right)
    style(row(2).columns(0), :borders => [:top, :left, :bottom])
    style(row(2).columns(1), :borders => [:top, :right, :bottom])
  end

  pdf.move_down 25

  invoice_terms_data = [ 
    ["Terms"],
    ["Payable upon receipt"]
  ]

  pdf.table(invoice_terms_data, :width => 275) do
    style(row(0..-1).columns(0..-1), :padding => [1, 0, 1, 0], :borders => [])
    style(row(0).columns(0), :font_style => :bold)
  end

  pdf.move_down 15

  invoice_notes_data = [ 
    ["Notes"],
    ["Thank you for doing business with Your Business Name"]
  ]

  pdf.table(invoice_notes_data, :width => 275) do
    style(row(0..-1).columns(0..-1), :padding => [1, 0, 1, 0], :borders => [])
    style(row(0).columns(0), :font_style => :bold)
  end

end
    
    
  end
  
    
