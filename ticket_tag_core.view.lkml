include: "//@{CONFIG_PROJECT_NAME}/ticket_tag.view.lkml"

view: ticket_tag {
  extends: [ticket_tag_config]
}

view: ticket_tag_core {
  sql_table_name: @{SCHEMA_NAME}.ticket_tag ;;

  dimension: pk {
    hidden: yes
    primary_key: yes
    sql: concat (${tag} , cast(${ticket_id} as string)) ;;
  }

  dimension: tag {
    type: string
    sql: ${TABLE}.tag ;;
  }

  dimension: ticket_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.ticket_id ;;
  }

  measure: count {
    type: count
    drill_fields: [ticket.id]
  }
}