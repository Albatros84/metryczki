class ProjectPdf < Prawn::Document
  def initialize (project, view)
    super()
      
    @project=project
    @view=view
    text "Project #{@project.id}"
      
  end
end