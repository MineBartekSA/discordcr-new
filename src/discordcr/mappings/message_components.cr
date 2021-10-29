module Discord
  struct Component
    include JSON::Serializable

    @[JSON::Field(converter: Enum::ValueConverter(Discord::ComponentType))]
    property type : ComponentType
    property custom_id : String?
    property disabled : Bool?
    @[JSON::Field(converter: Enum::ValueConverter(Discord::Style))]
    property style : Style?
    property label : String?
    property emoji : Emoji?
    property url : String?
    property options : Array(SelectOption)?
    property placeholder : String?
    property min_values : Int32?
    property max_values : Int32?
    property components : Array(Component)?

    def initialize(@type, @custom_id = nil, @disabled = nil, @style = nil, @label = nil, @emoji = nil, @url = nil, @options = nil, @placeholder = nil, @min_values = nil, @max_values = nil, @components = nil)
    end

    def self.action_row(components = nil)
      self.new(ComponentType::ActionRow, components: components)
    end

    def self.button(style = nil, label = nil, emoji = nil, custom_id = nil, url = nil, disabled = nil)
      self.new(ComponentType::Button, custom_id, disabled, style, label, emoji, url)
    end

    def self.select_menu(custom_id = nil, options = nil, placeholder = nil, min_values = nil, max_values = nil)
      self.new(ComponentType::SelectMenu, custom_id, options: options, placeholder: placeholder, min_values: min_values, max_values: max_values)
    end
  end

  enum ComponentType
    ActionRow  = 1
    Button     = 2
    SelectMenu = 3
  end

  enum Style
    Primary   = 1
    Secondary = 2
    Success   = 3
    Danger    = 4
    Link      = 5
  end

  struct SelectOption
    include JSON::Serializable

    property label : String
    property value : String
    property description : String?
    property emoji : Emoji?
    property default : Bool?

    def initalize(@label, @value, @description = nil, @emoji = nil, @default = nil)
    end
  end
end
