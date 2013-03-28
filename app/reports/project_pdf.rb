#!/usr/local/bin/ruby
# coding: utf-8
class ProjectPdf < Prawn::Document     
  def initialize (project, view, user)     
    super()      
       kw_mer=[:target_agreed_with_customer, :other_expectations, :subject, :profile_of_participants, :contact_person_on_client_side, :host_of_the_meeting, :other_information]      
       metryczka=[:client, :highrise, :name, :project_type, :skydrive, :basecamp, :numer_ks] 
       spr_org=[:participant_count, :game, :groups_division, :number_of_rooms, :date_of_game, :hour_duration,
        :localization, :contacts_client, :contacts_hotel, :transport_details, :accomodation]  
       zesp=[:leading_head_coach, :second_coach, :cpd_trainee, :assistants]
       przed_pro=[:agenda_of_meeting, :responsibilities_division, :after_game_summary, :invitation_for_participants]
       po_pro=[:purpose_and_other_expectations,:participants_short_description_in_groups,
        :course_of_training, :on_fly_findings_and_suggestions, :project_evaluation, :proposals_for_sales_potential,
        :merytoryka, :conduct_and_summary_of_game, :notes_on_materials, :notes_on_organization] 
                         
      @project=project
      @view=view
      @user=user
      
      logo    
      header(@project, metryczka, "Metryczka")
      metryczka(@project)      
      header(@project, spr_org, "Sprawy organizacyjne")
      spr_org(@project)
      
#       
      # header(@project, kw_mer, "Kwestie merytoryczne")
#       
#             
      # header(@project, zesp, "Zespół")
#       
#       
      # header(@project, przed_pro, "Przed projektem")
#      
#       
      # header(@project, po_pro, "Po projekcie")
#      
    end               
  end
    
  def header(project, kw_mer, head)
    @project=project
    @kw_mer=kw_mer        
    counter=0    
    
    @kw_mer.each do |kw| 
      kw=kw.to_s 
      str="@project."+"#{kw}"
        unless eval(str).nil? || eval(str)==""
             counter+=1
           end
    end
    
    unless counter==0  #jeżeli wszystkie elementy są puste to nie wyświetlamy tytułu
      move_down 10
      text "#{head}", :size=>16, :align=>:center      
    end
  end
  
  def logo
    move_down 10
    logopath =  "#{Rails.root}/app/assets/images/logo.jpg"
    image logopath, :width => 655, :height => 122, :position=>:center, :vposition=>:top, :scale=>0.38
    move_down 20
  end
  
  def show_field(field, title)    
    unless field.nil? || field==""; move_down 3; text title+": "+"#{field}", :size=>12; move_down 3 end
  end
    
  def metryczka(project)
    @project=project            
    show_field(@project.name, "Nazwa projektu") 
    show_field(@project.client, "Klient")
    show_field(@project.project_type, "Typ projektu")
    show_field(@project.numer_ks, "Numer ksiegowy")
    show_field(@project.highrise, "Highrise")
    show_field(@project.skydrive, "Skydrive")
    show_field(@project.basecamp, "Basecamp")
  end

  def spr_org(project)
    @project=project
    show_field(@project.participant_count, "Ilosc uczestników") 
    show_field(@project.game, "Gra")
    show_field(@project.groups_division, "Podzial na grupy")
    show_field(@project.number_of_rooms, "Ilosc pokoi")
    show_field(@project.date_of_game, "Data gry") 
    show_field(@project.hour_duration, "Czas trwania")
    show_field(@project.localization, "Lokalizacja")
    show_field(@project.contacts_client, "Osoby kontaktowe od strony organizacyjnej (klient)")
    show_field(@project.contacts_hotel, "Osoby kontaktowe od strony organizacyjnej (hotel)")
    show_field(@project.transport_details, "Szczegoly dotyczace transportu")
    show_field(@project.accomodation, "Zakwaterowanie")
  end

  def kw_mer(project)
    @project=project   
    show_field(@project.participant_count, "Ilosc uczestników") 
    show_field(@project.game, "Gra")
    show_field(@project.groups_division, "Podzial na grupy")
    show_field(@project.number_of_rooms, "Ilosc pokoi")
    show_field(@project.date_of_game, "Data gry") 
    show_field(@project.hour_duration, "Czas trwania")
    show_field(@project.localization, "Lokalizacja")
    show_field(@project.contacts_client, "Osoby kontaktowe od strony organizacyjnej (klient)")
    show_field(@project.contacts_hotel, "Osoby kontaktowe od strony organizacyjnej (hotel)")
    show_field(@project.transport_details, "Szczegoly dotyczace transportu")
    show_field(@project.accomodation, "Zakwaterowanie")
  end
  
  def body(project, kw_mer)
    @project=project  
    @kw_mer=kw_mer                        
      @kw_mer.each do |kw|   #wyświetlanie tylko jeżeli nie jest puste     
        str="@project."+"#{kw}"  
           unless eval(str).nil? || eval(str)==""
             text eval(str), :size=>10, :align=>:left
           end
      end          
  end








































































































































 

def lamus
   @metr.each do |me|   #wyświetlanie tylko jeżeli nie jest puste     
        str="@project."+"#{me}"  
           unless eval(str).nil? || eval(str)==""
             text eval(str), :size=>10, :align=>:left
           end
      end          
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
  
    
