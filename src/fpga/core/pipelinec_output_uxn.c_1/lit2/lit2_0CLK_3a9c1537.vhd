-- Timing params:
--   Fixed?: True
--   Pipeline Slices: []
--   Input regs?: False
--   Output regs?: False
library std;
use std.textio.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
-- use ieee.float_pkg.all;
use work.c_structs_pkg.all;
-- Submodules: 102
entity lit2_0CLK_3a9c1537 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 stack_index : in unsigned(0 downto 0);
 pc : in unsigned(15 downto 0);
 sp : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lit2_0CLK_3a9c1537;
architecture arch of lit2_0CLK_3a9c1537 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal lit2_tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_lit2_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l213_c6_7dce]
signal BIN_OP_EQ_uxn_opcodes_h_l213_c6_7dce_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l213_c6_7dce_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l213_c6_7dce_return_output : unsigned(0 downto 0);

-- lit2_tmp16_MUX[uxn_opcodes_h_l213_c2_90ce]
signal lit2_tmp16_MUX_uxn_opcodes_h_l213_c2_90ce_cond : unsigned(0 downto 0);
signal lit2_tmp16_MUX_uxn_opcodes_h_l213_c2_90ce_iftrue : unsigned(15 downto 0);
signal lit2_tmp16_MUX_uxn_opcodes_h_l213_c2_90ce_iffalse : unsigned(15 downto 0);
signal lit2_tmp16_MUX_uxn_opcodes_h_l213_c2_90ce_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l213_c2_90ce]
signal result_stack_value_MUX_uxn_opcodes_h_l213_c2_90ce_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l213_c2_90ce_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l213_c2_90ce_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l213_c2_90ce_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l213_c2_90ce]
signal result_is_opc_done_MUX_uxn_opcodes_h_l213_c2_90ce_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l213_c2_90ce_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l213_c2_90ce_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l213_c2_90ce_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l213_c2_90ce]
signal result_is_stack_read_MUX_uxn_opcodes_h_l213_c2_90ce_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l213_c2_90ce_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l213_c2_90ce_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l213_c2_90ce_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l213_c2_90ce]
signal result_is_stack_write_MUX_uxn_opcodes_h_l213_c2_90ce_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l213_c2_90ce_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l213_c2_90ce_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l213_c2_90ce_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l213_c2_90ce]
signal result_pc_MUX_uxn_opcodes_h_l213_c2_90ce_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l213_c2_90ce_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l213_c2_90ce_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l213_c2_90ce_return_output : unsigned(15 downto 0);

-- result_sp_MUX[uxn_opcodes_h_l213_c2_90ce]
signal result_sp_MUX_uxn_opcodes_h_l213_c2_90ce_cond : unsigned(0 downto 0);
signal result_sp_MUX_uxn_opcodes_h_l213_c2_90ce_iftrue : unsigned(7 downto 0);
signal result_sp_MUX_uxn_opcodes_h_l213_c2_90ce_iffalse : unsigned(7 downto 0);
signal result_sp_MUX_uxn_opcodes_h_l213_c2_90ce_return_output : unsigned(7 downto 0);

-- result_stack_address_MUX[uxn_opcodes_h_l213_c2_90ce]
signal result_stack_address_MUX_uxn_opcodes_h_l213_c2_90ce_cond : unsigned(0 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l213_c2_90ce_iftrue : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l213_c2_90ce_iffalse : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l213_c2_90ce_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l213_c2_90ce]
signal result_is_ram_read_MUX_uxn_opcodes_h_l213_c2_90ce_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l213_c2_90ce_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l213_c2_90ce_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l213_c2_90ce_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l213_c2_90ce]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l213_c2_90ce_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l213_c2_90ce_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l213_c2_90ce_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l213_c2_90ce_return_output : unsigned(0 downto 0);

-- result_is_sp_updated_MUX[uxn_opcodes_h_l213_c2_90ce]
signal result_is_sp_updated_MUX_uxn_opcodes_h_l213_c2_90ce_cond : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l213_c2_90ce_iftrue : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l213_c2_90ce_iffalse : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l213_c2_90ce_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l213_c2_90ce]
signal result_ram_addr_MUX_uxn_opcodes_h_l213_c2_90ce_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l213_c2_90ce_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l213_c2_90ce_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l213_c2_90ce_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l213_c2_90ce]
signal result_is_ram_write_MUX_uxn_opcodes_h_l213_c2_90ce_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l213_c2_90ce_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l213_c2_90ce_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l213_c2_90ce_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l215_c15_e50f]
signal BIN_OP_PLUS_uxn_opcodes_h_l215_c15_e50f_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l215_c15_e50f_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l215_c15_e50f_return_output : unsigned(8 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l218_c11_450d]
signal BIN_OP_EQ_uxn_opcodes_h_l218_c11_450d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l218_c11_450d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l218_c11_450d_return_output : unsigned(0 downto 0);

-- lit2_tmp16_MUX[uxn_opcodes_h_l218_c7_2f08]
signal lit2_tmp16_MUX_uxn_opcodes_h_l218_c7_2f08_cond : unsigned(0 downto 0);
signal lit2_tmp16_MUX_uxn_opcodes_h_l218_c7_2f08_iftrue : unsigned(15 downto 0);
signal lit2_tmp16_MUX_uxn_opcodes_h_l218_c7_2f08_iffalse : unsigned(15 downto 0);
signal lit2_tmp16_MUX_uxn_opcodes_h_l218_c7_2f08_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l218_c7_2f08]
signal result_stack_value_MUX_uxn_opcodes_h_l218_c7_2f08_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l218_c7_2f08_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l218_c7_2f08_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l218_c7_2f08_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l218_c7_2f08]
signal result_is_opc_done_MUX_uxn_opcodes_h_l218_c7_2f08_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l218_c7_2f08_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l218_c7_2f08_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l218_c7_2f08_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l218_c7_2f08]
signal result_is_stack_read_MUX_uxn_opcodes_h_l218_c7_2f08_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l218_c7_2f08_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l218_c7_2f08_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l218_c7_2f08_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l218_c7_2f08]
signal result_is_stack_write_MUX_uxn_opcodes_h_l218_c7_2f08_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l218_c7_2f08_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l218_c7_2f08_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l218_c7_2f08_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l218_c7_2f08]
signal result_pc_MUX_uxn_opcodes_h_l218_c7_2f08_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l218_c7_2f08_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l218_c7_2f08_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l218_c7_2f08_return_output : unsigned(15 downto 0);

-- result_stack_address_MUX[uxn_opcodes_h_l218_c7_2f08]
signal result_stack_address_MUX_uxn_opcodes_h_l218_c7_2f08_cond : unsigned(0 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l218_c7_2f08_iftrue : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l218_c7_2f08_iffalse : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l218_c7_2f08_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l218_c7_2f08]
signal result_is_ram_read_MUX_uxn_opcodes_h_l218_c7_2f08_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l218_c7_2f08_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l218_c7_2f08_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l218_c7_2f08_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l218_c7_2f08]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l218_c7_2f08_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l218_c7_2f08_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l218_c7_2f08_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l218_c7_2f08_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l218_c7_2f08]
signal result_ram_addr_MUX_uxn_opcodes_h_l218_c7_2f08_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l218_c7_2f08_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l218_c7_2f08_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l218_c7_2f08_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l218_c7_2f08]
signal result_is_ram_write_MUX_uxn_opcodes_h_l218_c7_2f08_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l218_c7_2f08_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l218_c7_2f08_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l218_c7_2f08_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l223_c11_746a]
signal BIN_OP_EQ_uxn_opcodes_h_l223_c11_746a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l223_c11_746a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l223_c11_746a_return_output : unsigned(0 downto 0);

-- lit2_tmp16_MUX[uxn_opcodes_h_l223_c7_079f]
signal lit2_tmp16_MUX_uxn_opcodes_h_l223_c7_079f_cond : unsigned(0 downto 0);
signal lit2_tmp16_MUX_uxn_opcodes_h_l223_c7_079f_iftrue : unsigned(15 downto 0);
signal lit2_tmp16_MUX_uxn_opcodes_h_l223_c7_079f_iffalse : unsigned(15 downto 0);
signal lit2_tmp16_MUX_uxn_opcodes_h_l223_c7_079f_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l223_c7_079f]
signal result_stack_value_MUX_uxn_opcodes_h_l223_c7_079f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l223_c7_079f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l223_c7_079f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l223_c7_079f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l223_c7_079f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l223_c7_079f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l223_c7_079f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l223_c7_079f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l223_c7_079f_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l223_c7_079f]
signal result_is_stack_read_MUX_uxn_opcodes_h_l223_c7_079f_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l223_c7_079f_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l223_c7_079f_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l223_c7_079f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l223_c7_079f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l223_c7_079f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l223_c7_079f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l223_c7_079f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l223_c7_079f_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l223_c7_079f]
signal result_pc_MUX_uxn_opcodes_h_l223_c7_079f_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l223_c7_079f_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l223_c7_079f_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l223_c7_079f_return_output : unsigned(15 downto 0);

-- result_stack_address_MUX[uxn_opcodes_h_l223_c7_079f]
signal result_stack_address_MUX_uxn_opcodes_h_l223_c7_079f_cond : unsigned(0 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l223_c7_079f_iftrue : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l223_c7_079f_iffalse : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l223_c7_079f_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l223_c7_079f]
signal result_is_ram_read_MUX_uxn_opcodes_h_l223_c7_079f_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l223_c7_079f_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l223_c7_079f_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l223_c7_079f_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l223_c7_079f]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l223_c7_079f_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l223_c7_079f_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l223_c7_079f_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l223_c7_079f_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l223_c7_079f]
signal result_ram_addr_MUX_uxn_opcodes_h_l223_c7_079f_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l223_c7_079f_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l223_c7_079f_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l223_c7_079f_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l223_c7_079f]
signal result_is_ram_write_MUX_uxn_opcodes_h_l223_c7_079f_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l223_c7_079f_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l223_c7_079f_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l223_c7_079f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l228_c11_40cd]
signal BIN_OP_EQ_uxn_opcodes_h_l228_c11_40cd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l228_c11_40cd_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l228_c11_40cd_return_output : unsigned(0 downto 0);

-- lit2_tmp16_MUX[uxn_opcodes_h_l228_c7_24e0]
signal lit2_tmp16_MUX_uxn_opcodes_h_l228_c7_24e0_cond : unsigned(0 downto 0);
signal lit2_tmp16_MUX_uxn_opcodes_h_l228_c7_24e0_iftrue : unsigned(15 downto 0);
signal lit2_tmp16_MUX_uxn_opcodes_h_l228_c7_24e0_iffalse : unsigned(15 downto 0);
signal lit2_tmp16_MUX_uxn_opcodes_h_l228_c7_24e0_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l228_c7_24e0]
signal result_stack_value_MUX_uxn_opcodes_h_l228_c7_24e0_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l228_c7_24e0_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l228_c7_24e0_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l228_c7_24e0_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l228_c7_24e0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l228_c7_24e0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l228_c7_24e0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l228_c7_24e0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l228_c7_24e0_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l228_c7_24e0]
signal result_is_stack_read_MUX_uxn_opcodes_h_l228_c7_24e0_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l228_c7_24e0_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l228_c7_24e0_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l228_c7_24e0_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l228_c7_24e0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l228_c7_24e0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l228_c7_24e0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l228_c7_24e0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l228_c7_24e0_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l228_c7_24e0]
signal result_pc_MUX_uxn_opcodes_h_l228_c7_24e0_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l228_c7_24e0_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l228_c7_24e0_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l228_c7_24e0_return_output : unsigned(15 downto 0);

-- result_stack_address_MUX[uxn_opcodes_h_l228_c7_24e0]
signal result_stack_address_MUX_uxn_opcodes_h_l228_c7_24e0_cond : unsigned(0 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l228_c7_24e0_iftrue : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l228_c7_24e0_iffalse : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l228_c7_24e0_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l228_c7_24e0]
signal result_is_ram_read_MUX_uxn_opcodes_h_l228_c7_24e0_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l228_c7_24e0_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l228_c7_24e0_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l228_c7_24e0_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l228_c7_24e0]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l228_c7_24e0_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l228_c7_24e0_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l228_c7_24e0_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l228_c7_24e0_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l228_c7_24e0]
signal result_ram_addr_MUX_uxn_opcodes_h_l228_c7_24e0_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l228_c7_24e0_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l228_c7_24e0_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l228_c7_24e0_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l228_c7_24e0]
signal result_is_ram_write_MUX_uxn_opcodes_h_l228_c7_24e0_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l228_c7_24e0_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l228_c7_24e0_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l228_c7_24e0_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l230_c3_766c]
signal CONST_SL_8_uxn_opcodes_h_l230_c3_766c_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l230_c3_766c_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l233_c21_4d12]
signal BIN_OP_PLUS_uxn_opcodes_h_l233_c21_4d12_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l233_c21_4d12_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l233_c21_4d12_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l235_c11_701d]
signal BIN_OP_EQ_uxn_opcodes_h_l235_c11_701d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l235_c11_701d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l235_c11_701d_return_output : unsigned(0 downto 0);

-- lit2_tmp16_MUX[uxn_opcodes_h_l235_c7_1aa7]
signal lit2_tmp16_MUX_uxn_opcodes_h_l235_c7_1aa7_cond : unsigned(0 downto 0);
signal lit2_tmp16_MUX_uxn_opcodes_h_l235_c7_1aa7_iftrue : unsigned(15 downto 0);
signal lit2_tmp16_MUX_uxn_opcodes_h_l235_c7_1aa7_iffalse : unsigned(15 downto 0);
signal lit2_tmp16_MUX_uxn_opcodes_h_l235_c7_1aa7_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l235_c7_1aa7]
signal result_stack_value_MUX_uxn_opcodes_h_l235_c7_1aa7_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l235_c7_1aa7_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l235_c7_1aa7_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l235_c7_1aa7_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l235_c7_1aa7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l235_c7_1aa7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l235_c7_1aa7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l235_c7_1aa7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l235_c7_1aa7_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l235_c7_1aa7]
signal result_is_stack_read_MUX_uxn_opcodes_h_l235_c7_1aa7_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l235_c7_1aa7_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l235_c7_1aa7_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l235_c7_1aa7_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l235_c7_1aa7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l235_c7_1aa7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l235_c7_1aa7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l235_c7_1aa7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l235_c7_1aa7_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l235_c7_1aa7]
signal result_pc_MUX_uxn_opcodes_h_l235_c7_1aa7_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l235_c7_1aa7_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l235_c7_1aa7_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l235_c7_1aa7_return_output : unsigned(15 downto 0);

-- result_stack_address_MUX[uxn_opcodes_h_l235_c7_1aa7]
signal result_stack_address_MUX_uxn_opcodes_h_l235_c7_1aa7_cond : unsigned(0 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l235_c7_1aa7_iftrue : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l235_c7_1aa7_iffalse : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l235_c7_1aa7_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l235_c7_1aa7]
signal result_is_ram_read_MUX_uxn_opcodes_h_l235_c7_1aa7_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l235_c7_1aa7_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l235_c7_1aa7_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l235_c7_1aa7_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l235_c7_1aa7]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l235_c7_1aa7_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l235_c7_1aa7_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l235_c7_1aa7_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l235_c7_1aa7_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l235_c7_1aa7]
signal result_ram_addr_MUX_uxn_opcodes_h_l235_c7_1aa7_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l235_c7_1aa7_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l235_c7_1aa7_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l235_c7_1aa7_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l235_c7_1aa7]
signal result_is_ram_write_MUX_uxn_opcodes_h_l235_c7_1aa7_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l235_c7_1aa7_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l235_c7_1aa7_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l235_c7_1aa7_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l238_c21_901e]
signal BIN_OP_PLUS_uxn_opcodes_h_l238_c21_901e_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l238_c21_901e_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l238_c21_901e_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l240_c11_a09b]
signal BIN_OP_EQ_uxn_opcodes_h_l240_c11_a09b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l240_c11_a09b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l240_c11_a09b_return_output : unsigned(0 downto 0);

-- lit2_tmp16_MUX[uxn_opcodes_h_l240_c7_f4b1]
signal lit2_tmp16_MUX_uxn_opcodes_h_l240_c7_f4b1_cond : unsigned(0 downto 0);
signal lit2_tmp16_MUX_uxn_opcodes_h_l240_c7_f4b1_iftrue : unsigned(15 downto 0);
signal lit2_tmp16_MUX_uxn_opcodes_h_l240_c7_f4b1_iffalse : unsigned(15 downto 0);
signal lit2_tmp16_MUX_uxn_opcodes_h_l240_c7_f4b1_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l240_c7_f4b1]
signal result_stack_value_MUX_uxn_opcodes_h_l240_c7_f4b1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l240_c7_f4b1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l240_c7_f4b1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l240_c7_f4b1_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l240_c7_f4b1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l240_c7_f4b1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l240_c7_f4b1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l240_c7_f4b1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l240_c7_f4b1_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l240_c7_f4b1]
signal result_is_stack_read_MUX_uxn_opcodes_h_l240_c7_f4b1_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l240_c7_f4b1_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l240_c7_f4b1_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l240_c7_f4b1_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l240_c7_f4b1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l240_c7_f4b1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l240_c7_f4b1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l240_c7_f4b1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l240_c7_f4b1_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l240_c7_f4b1]
signal result_pc_MUX_uxn_opcodes_h_l240_c7_f4b1_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l240_c7_f4b1_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l240_c7_f4b1_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l240_c7_f4b1_return_output : unsigned(15 downto 0);

-- result_stack_address_MUX[uxn_opcodes_h_l240_c7_f4b1]
signal result_stack_address_MUX_uxn_opcodes_h_l240_c7_f4b1_cond : unsigned(0 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l240_c7_f4b1_iftrue : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l240_c7_f4b1_iffalse : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l240_c7_f4b1_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l240_c7_f4b1]
signal result_is_ram_read_MUX_uxn_opcodes_h_l240_c7_f4b1_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l240_c7_f4b1_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l240_c7_f4b1_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l240_c7_f4b1_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l240_c7_f4b1]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l240_c7_f4b1_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l240_c7_f4b1_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l240_c7_f4b1_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l240_c7_f4b1_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l240_c7_f4b1]
signal result_ram_addr_MUX_uxn_opcodes_h_l240_c7_f4b1_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l240_c7_f4b1_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l240_c7_f4b1_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l240_c7_f4b1_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l241_c3_1959]
signal BIN_OP_OR_uxn_opcodes_h_l241_c3_1959_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l241_c3_1959_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l241_c3_1959_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l243_c15_5766]
signal BIN_OP_PLUS_uxn_opcodes_h_l243_c15_5766_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l243_c15_5766_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l243_c15_5766_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l245_c11_abdb]
signal BIN_OP_EQ_uxn_opcodes_h_l245_c11_abdb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l245_c11_abdb_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l245_c11_abdb_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l245_c7_89f9]
signal result_stack_value_MUX_uxn_opcodes_h_l245_c7_89f9_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l245_c7_89f9_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l245_c7_89f9_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l245_c7_89f9_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l245_c7_89f9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l245_c7_89f9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l245_c7_89f9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l245_c7_89f9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l245_c7_89f9_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l245_c7_89f9]
signal result_is_stack_read_MUX_uxn_opcodes_h_l245_c7_89f9_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l245_c7_89f9_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l245_c7_89f9_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l245_c7_89f9_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l245_c7_89f9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l245_c7_89f9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l245_c7_89f9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l245_c7_89f9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l245_c7_89f9_return_output : unsigned(0 downto 0);

-- result_stack_address_MUX[uxn_opcodes_h_l245_c7_89f9]
signal result_stack_address_MUX_uxn_opcodes_h_l245_c7_89f9_cond : unsigned(0 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l245_c7_89f9_iftrue : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l245_c7_89f9_iffalse : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l245_c7_89f9_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l245_c7_89f9]
signal result_is_ram_read_MUX_uxn_opcodes_h_l245_c7_89f9_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l245_c7_89f9_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l245_c7_89f9_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l245_c7_89f9_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l245_c7_89f9]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l245_c7_89f9_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l245_c7_89f9_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l245_c7_89f9_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l245_c7_89f9_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l245_c7_89f9]
signal result_ram_addr_MUX_uxn_opcodes_h_l245_c7_89f9_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l245_c7_89f9_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l245_c7_89f9_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l245_c7_89f9_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l251_c26_ff03]
signal BIN_OP_MINUS_uxn_opcodes_h_l251_c26_ff03_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l251_c26_ff03_right : unsigned(0 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l251_c26_ff03_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l254_c11_82da]
signal BIN_OP_EQ_uxn_opcodes_h_l254_c11_82da_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l254_c11_82da_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l254_c11_82da_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l254_c7_7d9e]
signal result_stack_value_MUX_uxn_opcodes_h_l254_c7_7d9e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l254_c7_7d9e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l254_c7_7d9e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l254_c7_7d9e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l254_c7_7d9e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_7d9e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_7d9e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_7d9e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_7d9e_return_output : unsigned(0 downto 0);

-- result_stack_address_MUX[uxn_opcodes_h_l254_c7_7d9e]
signal result_stack_address_MUX_uxn_opcodes_h_l254_c7_7d9e_cond : unsigned(0 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l254_c7_7d9e_iftrue : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l254_c7_7d9e_iffalse : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l254_c7_7d9e_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l254_c7_7d9e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_7d9e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_7d9e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_7d9e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_7d9e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l254_c7_7d9e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_7d9e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_7d9e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_7d9e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_7d9e_return_output : unsigned(0 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l257_c26_330f]
signal BIN_OP_MINUS_uxn_opcodes_h_l257_c26_330f_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l257_c26_330f_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l257_c26_330f_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l258_c34_6db1]
signal CONST_SR_8_uxn_opcodes_h_l258_c34_6db1_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l258_c34_6db1_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l266_c2_1672[uxn_opcodes_h_l266_c2_1672]
signal printf_uxn_opcodes_h_l266_c2_1672_uxn_opcodes_h_l266_c2_1672_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l266_c2_1672_uxn_opcodes_h_l266_c2_1672_arg0 : unsigned(31 downto 0);
signal printf_uxn_opcodes_h_l266_c2_1672_uxn_opcodes_h_l266_c2_1672_arg1 : unsigned(31 downto 0);
signal printf_uxn_opcodes_h_l266_c2_1672_uxn_opcodes_h_l266_c2_1672_arg2 : unsigned(31 downto 0);
signal printf_uxn_opcodes_h_l266_c2_1672_uxn_opcodes_h_l266_c2_1672_arg3 : unsigned(31 downto 0);
signal printf_uxn_opcodes_h_l266_c2_1672_uxn_opcodes_h_l266_c2_1672_arg4 : unsigned(31 downto 0);

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_4937( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned;
 ref_toks_11 : unsigned;
 ref_toks_12 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_value := ref_toks_1;
      base.is_opc_done := ref_toks_2;
      base.is_stack_read := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.pc := ref_toks_5;
      base.sp := ref_toks_6;
      base.stack_address := ref_toks_7;
      base.is_ram_read := ref_toks_8;
      base.is_pc_updated := ref_toks_9;
      base.is_sp_updated := ref_toks_10;
      base.ram_addr := ref_toks_11;
      base.is_ram_write := ref_toks_12;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l213_c6_7dce
BIN_OP_EQ_uxn_opcodes_h_l213_c6_7dce : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l213_c6_7dce_left,
BIN_OP_EQ_uxn_opcodes_h_l213_c6_7dce_right,
BIN_OP_EQ_uxn_opcodes_h_l213_c6_7dce_return_output);

-- lit2_tmp16_MUX_uxn_opcodes_h_l213_c2_90ce
lit2_tmp16_MUX_uxn_opcodes_h_l213_c2_90ce : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
lit2_tmp16_MUX_uxn_opcodes_h_l213_c2_90ce_cond,
lit2_tmp16_MUX_uxn_opcodes_h_l213_c2_90ce_iftrue,
lit2_tmp16_MUX_uxn_opcodes_h_l213_c2_90ce_iffalse,
lit2_tmp16_MUX_uxn_opcodes_h_l213_c2_90ce_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l213_c2_90ce
result_stack_value_MUX_uxn_opcodes_h_l213_c2_90ce : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l213_c2_90ce_cond,
result_stack_value_MUX_uxn_opcodes_h_l213_c2_90ce_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l213_c2_90ce_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l213_c2_90ce_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l213_c2_90ce
result_is_opc_done_MUX_uxn_opcodes_h_l213_c2_90ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l213_c2_90ce_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l213_c2_90ce_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l213_c2_90ce_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l213_c2_90ce_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l213_c2_90ce
result_is_stack_read_MUX_uxn_opcodes_h_l213_c2_90ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l213_c2_90ce_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l213_c2_90ce_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l213_c2_90ce_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l213_c2_90ce_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l213_c2_90ce
result_is_stack_write_MUX_uxn_opcodes_h_l213_c2_90ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l213_c2_90ce_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l213_c2_90ce_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l213_c2_90ce_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l213_c2_90ce_return_output);

-- result_pc_MUX_uxn_opcodes_h_l213_c2_90ce
result_pc_MUX_uxn_opcodes_h_l213_c2_90ce : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l213_c2_90ce_cond,
result_pc_MUX_uxn_opcodes_h_l213_c2_90ce_iftrue,
result_pc_MUX_uxn_opcodes_h_l213_c2_90ce_iffalse,
result_pc_MUX_uxn_opcodes_h_l213_c2_90ce_return_output);

-- result_sp_MUX_uxn_opcodes_h_l213_c2_90ce
result_sp_MUX_uxn_opcodes_h_l213_c2_90ce : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_sp_MUX_uxn_opcodes_h_l213_c2_90ce_cond,
result_sp_MUX_uxn_opcodes_h_l213_c2_90ce_iftrue,
result_sp_MUX_uxn_opcodes_h_l213_c2_90ce_iffalse,
result_sp_MUX_uxn_opcodes_h_l213_c2_90ce_return_output);

-- result_stack_address_MUX_uxn_opcodes_h_l213_c2_90ce
result_stack_address_MUX_uxn_opcodes_h_l213_c2_90ce : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_MUX_uxn_opcodes_h_l213_c2_90ce_cond,
result_stack_address_MUX_uxn_opcodes_h_l213_c2_90ce_iftrue,
result_stack_address_MUX_uxn_opcodes_h_l213_c2_90ce_iffalse,
result_stack_address_MUX_uxn_opcodes_h_l213_c2_90ce_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l213_c2_90ce
result_is_ram_read_MUX_uxn_opcodes_h_l213_c2_90ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l213_c2_90ce_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l213_c2_90ce_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l213_c2_90ce_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l213_c2_90ce_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l213_c2_90ce
result_is_pc_updated_MUX_uxn_opcodes_h_l213_c2_90ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l213_c2_90ce_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l213_c2_90ce_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l213_c2_90ce_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l213_c2_90ce_return_output);

-- result_is_sp_updated_MUX_uxn_opcodes_h_l213_c2_90ce
result_is_sp_updated_MUX_uxn_opcodes_h_l213_c2_90ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_updated_MUX_uxn_opcodes_h_l213_c2_90ce_cond,
result_is_sp_updated_MUX_uxn_opcodes_h_l213_c2_90ce_iftrue,
result_is_sp_updated_MUX_uxn_opcodes_h_l213_c2_90ce_iffalse,
result_is_sp_updated_MUX_uxn_opcodes_h_l213_c2_90ce_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l213_c2_90ce
result_ram_addr_MUX_uxn_opcodes_h_l213_c2_90ce : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l213_c2_90ce_cond,
result_ram_addr_MUX_uxn_opcodes_h_l213_c2_90ce_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l213_c2_90ce_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l213_c2_90ce_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l213_c2_90ce
result_is_ram_write_MUX_uxn_opcodes_h_l213_c2_90ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l213_c2_90ce_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l213_c2_90ce_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l213_c2_90ce_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l213_c2_90ce_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l215_c15_e50f
BIN_OP_PLUS_uxn_opcodes_h_l215_c15_e50f : entity work.BIN_OP_PLUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l215_c15_e50f_left,
BIN_OP_PLUS_uxn_opcodes_h_l215_c15_e50f_right,
BIN_OP_PLUS_uxn_opcodes_h_l215_c15_e50f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l218_c11_450d
BIN_OP_EQ_uxn_opcodes_h_l218_c11_450d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l218_c11_450d_left,
BIN_OP_EQ_uxn_opcodes_h_l218_c11_450d_right,
BIN_OP_EQ_uxn_opcodes_h_l218_c11_450d_return_output);

-- lit2_tmp16_MUX_uxn_opcodes_h_l218_c7_2f08
lit2_tmp16_MUX_uxn_opcodes_h_l218_c7_2f08 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
lit2_tmp16_MUX_uxn_opcodes_h_l218_c7_2f08_cond,
lit2_tmp16_MUX_uxn_opcodes_h_l218_c7_2f08_iftrue,
lit2_tmp16_MUX_uxn_opcodes_h_l218_c7_2f08_iffalse,
lit2_tmp16_MUX_uxn_opcodes_h_l218_c7_2f08_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l218_c7_2f08
result_stack_value_MUX_uxn_opcodes_h_l218_c7_2f08 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l218_c7_2f08_cond,
result_stack_value_MUX_uxn_opcodes_h_l218_c7_2f08_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l218_c7_2f08_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l218_c7_2f08_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l218_c7_2f08
result_is_opc_done_MUX_uxn_opcodes_h_l218_c7_2f08 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l218_c7_2f08_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l218_c7_2f08_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l218_c7_2f08_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l218_c7_2f08_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l218_c7_2f08
result_is_stack_read_MUX_uxn_opcodes_h_l218_c7_2f08 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l218_c7_2f08_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l218_c7_2f08_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l218_c7_2f08_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l218_c7_2f08_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l218_c7_2f08
result_is_stack_write_MUX_uxn_opcodes_h_l218_c7_2f08 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l218_c7_2f08_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l218_c7_2f08_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l218_c7_2f08_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l218_c7_2f08_return_output);

-- result_pc_MUX_uxn_opcodes_h_l218_c7_2f08
result_pc_MUX_uxn_opcodes_h_l218_c7_2f08 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l218_c7_2f08_cond,
result_pc_MUX_uxn_opcodes_h_l218_c7_2f08_iftrue,
result_pc_MUX_uxn_opcodes_h_l218_c7_2f08_iffalse,
result_pc_MUX_uxn_opcodes_h_l218_c7_2f08_return_output);

-- result_stack_address_MUX_uxn_opcodes_h_l218_c7_2f08
result_stack_address_MUX_uxn_opcodes_h_l218_c7_2f08 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_MUX_uxn_opcodes_h_l218_c7_2f08_cond,
result_stack_address_MUX_uxn_opcodes_h_l218_c7_2f08_iftrue,
result_stack_address_MUX_uxn_opcodes_h_l218_c7_2f08_iffalse,
result_stack_address_MUX_uxn_opcodes_h_l218_c7_2f08_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l218_c7_2f08
result_is_ram_read_MUX_uxn_opcodes_h_l218_c7_2f08 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l218_c7_2f08_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l218_c7_2f08_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l218_c7_2f08_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l218_c7_2f08_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l218_c7_2f08
result_is_pc_updated_MUX_uxn_opcodes_h_l218_c7_2f08 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l218_c7_2f08_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l218_c7_2f08_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l218_c7_2f08_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l218_c7_2f08_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l218_c7_2f08
result_ram_addr_MUX_uxn_opcodes_h_l218_c7_2f08 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l218_c7_2f08_cond,
result_ram_addr_MUX_uxn_opcodes_h_l218_c7_2f08_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l218_c7_2f08_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l218_c7_2f08_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l218_c7_2f08
result_is_ram_write_MUX_uxn_opcodes_h_l218_c7_2f08 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l218_c7_2f08_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l218_c7_2f08_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l218_c7_2f08_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l218_c7_2f08_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l223_c11_746a
BIN_OP_EQ_uxn_opcodes_h_l223_c11_746a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l223_c11_746a_left,
BIN_OP_EQ_uxn_opcodes_h_l223_c11_746a_right,
BIN_OP_EQ_uxn_opcodes_h_l223_c11_746a_return_output);

-- lit2_tmp16_MUX_uxn_opcodes_h_l223_c7_079f
lit2_tmp16_MUX_uxn_opcodes_h_l223_c7_079f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
lit2_tmp16_MUX_uxn_opcodes_h_l223_c7_079f_cond,
lit2_tmp16_MUX_uxn_opcodes_h_l223_c7_079f_iftrue,
lit2_tmp16_MUX_uxn_opcodes_h_l223_c7_079f_iffalse,
lit2_tmp16_MUX_uxn_opcodes_h_l223_c7_079f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l223_c7_079f
result_stack_value_MUX_uxn_opcodes_h_l223_c7_079f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l223_c7_079f_cond,
result_stack_value_MUX_uxn_opcodes_h_l223_c7_079f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l223_c7_079f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l223_c7_079f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l223_c7_079f
result_is_opc_done_MUX_uxn_opcodes_h_l223_c7_079f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l223_c7_079f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l223_c7_079f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l223_c7_079f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l223_c7_079f_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l223_c7_079f
result_is_stack_read_MUX_uxn_opcodes_h_l223_c7_079f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l223_c7_079f_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l223_c7_079f_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l223_c7_079f_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l223_c7_079f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l223_c7_079f
result_is_stack_write_MUX_uxn_opcodes_h_l223_c7_079f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l223_c7_079f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l223_c7_079f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l223_c7_079f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l223_c7_079f_return_output);

-- result_pc_MUX_uxn_opcodes_h_l223_c7_079f
result_pc_MUX_uxn_opcodes_h_l223_c7_079f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l223_c7_079f_cond,
result_pc_MUX_uxn_opcodes_h_l223_c7_079f_iftrue,
result_pc_MUX_uxn_opcodes_h_l223_c7_079f_iffalse,
result_pc_MUX_uxn_opcodes_h_l223_c7_079f_return_output);

-- result_stack_address_MUX_uxn_opcodes_h_l223_c7_079f
result_stack_address_MUX_uxn_opcodes_h_l223_c7_079f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_MUX_uxn_opcodes_h_l223_c7_079f_cond,
result_stack_address_MUX_uxn_opcodes_h_l223_c7_079f_iftrue,
result_stack_address_MUX_uxn_opcodes_h_l223_c7_079f_iffalse,
result_stack_address_MUX_uxn_opcodes_h_l223_c7_079f_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l223_c7_079f
result_is_ram_read_MUX_uxn_opcodes_h_l223_c7_079f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l223_c7_079f_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l223_c7_079f_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l223_c7_079f_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l223_c7_079f_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l223_c7_079f
result_is_pc_updated_MUX_uxn_opcodes_h_l223_c7_079f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l223_c7_079f_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l223_c7_079f_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l223_c7_079f_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l223_c7_079f_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l223_c7_079f
result_ram_addr_MUX_uxn_opcodes_h_l223_c7_079f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l223_c7_079f_cond,
result_ram_addr_MUX_uxn_opcodes_h_l223_c7_079f_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l223_c7_079f_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l223_c7_079f_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l223_c7_079f
result_is_ram_write_MUX_uxn_opcodes_h_l223_c7_079f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l223_c7_079f_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l223_c7_079f_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l223_c7_079f_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l223_c7_079f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l228_c11_40cd
BIN_OP_EQ_uxn_opcodes_h_l228_c11_40cd : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l228_c11_40cd_left,
BIN_OP_EQ_uxn_opcodes_h_l228_c11_40cd_right,
BIN_OP_EQ_uxn_opcodes_h_l228_c11_40cd_return_output);

-- lit2_tmp16_MUX_uxn_opcodes_h_l228_c7_24e0
lit2_tmp16_MUX_uxn_opcodes_h_l228_c7_24e0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
lit2_tmp16_MUX_uxn_opcodes_h_l228_c7_24e0_cond,
lit2_tmp16_MUX_uxn_opcodes_h_l228_c7_24e0_iftrue,
lit2_tmp16_MUX_uxn_opcodes_h_l228_c7_24e0_iffalse,
lit2_tmp16_MUX_uxn_opcodes_h_l228_c7_24e0_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l228_c7_24e0
result_stack_value_MUX_uxn_opcodes_h_l228_c7_24e0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l228_c7_24e0_cond,
result_stack_value_MUX_uxn_opcodes_h_l228_c7_24e0_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l228_c7_24e0_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l228_c7_24e0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l228_c7_24e0
result_is_opc_done_MUX_uxn_opcodes_h_l228_c7_24e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l228_c7_24e0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l228_c7_24e0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l228_c7_24e0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l228_c7_24e0_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l228_c7_24e0
result_is_stack_read_MUX_uxn_opcodes_h_l228_c7_24e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l228_c7_24e0_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l228_c7_24e0_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l228_c7_24e0_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l228_c7_24e0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l228_c7_24e0
result_is_stack_write_MUX_uxn_opcodes_h_l228_c7_24e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l228_c7_24e0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l228_c7_24e0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l228_c7_24e0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l228_c7_24e0_return_output);

-- result_pc_MUX_uxn_opcodes_h_l228_c7_24e0
result_pc_MUX_uxn_opcodes_h_l228_c7_24e0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l228_c7_24e0_cond,
result_pc_MUX_uxn_opcodes_h_l228_c7_24e0_iftrue,
result_pc_MUX_uxn_opcodes_h_l228_c7_24e0_iffalse,
result_pc_MUX_uxn_opcodes_h_l228_c7_24e0_return_output);

-- result_stack_address_MUX_uxn_opcodes_h_l228_c7_24e0
result_stack_address_MUX_uxn_opcodes_h_l228_c7_24e0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_MUX_uxn_opcodes_h_l228_c7_24e0_cond,
result_stack_address_MUX_uxn_opcodes_h_l228_c7_24e0_iftrue,
result_stack_address_MUX_uxn_opcodes_h_l228_c7_24e0_iffalse,
result_stack_address_MUX_uxn_opcodes_h_l228_c7_24e0_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l228_c7_24e0
result_is_ram_read_MUX_uxn_opcodes_h_l228_c7_24e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l228_c7_24e0_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l228_c7_24e0_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l228_c7_24e0_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l228_c7_24e0_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l228_c7_24e0
result_is_pc_updated_MUX_uxn_opcodes_h_l228_c7_24e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l228_c7_24e0_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l228_c7_24e0_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l228_c7_24e0_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l228_c7_24e0_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l228_c7_24e0
result_ram_addr_MUX_uxn_opcodes_h_l228_c7_24e0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l228_c7_24e0_cond,
result_ram_addr_MUX_uxn_opcodes_h_l228_c7_24e0_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l228_c7_24e0_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l228_c7_24e0_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l228_c7_24e0
result_is_ram_write_MUX_uxn_opcodes_h_l228_c7_24e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l228_c7_24e0_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l228_c7_24e0_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l228_c7_24e0_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l228_c7_24e0_return_output);

-- CONST_SL_8_uxn_opcodes_h_l230_c3_766c
CONST_SL_8_uxn_opcodes_h_l230_c3_766c : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l230_c3_766c_x,
CONST_SL_8_uxn_opcodes_h_l230_c3_766c_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l233_c21_4d12
BIN_OP_PLUS_uxn_opcodes_h_l233_c21_4d12 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l233_c21_4d12_left,
BIN_OP_PLUS_uxn_opcodes_h_l233_c21_4d12_right,
BIN_OP_PLUS_uxn_opcodes_h_l233_c21_4d12_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l235_c11_701d
BIN_OP_EQ_uxn_opcodes_h_l235_c11_701d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l235_c11_701d_left,
BIN_OP_EQ_uxn_opcodes_h_l235_c11_701d_right,
BIN_OP_EQ_uxn_opcodes_h_l235_c11_701d_return_output);

-- lit2_tmp16_MUX_uxn_opcodes_h_l235_c7_1aa7
lit2_tmp16_MUX_uxn_opcodes_h_l235_c7_1aa7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
lit2_tmp16_MUX_uxn_opcodes_h_l235_c7_1aa7_cond,
lit2_tmp16_MUX_uxn_opcodes_h_l235_c7_1aa7_iftrue,
lit2_tmp16_MUX_uxn_opcodes_h_l235_c7_1aa7_iffalse,
lit2_tmp16_MUX_uxn_opcodes_h_l235_c7_1aa7_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l235_c7_1aa7
result_stack_value_MUX_uxn_opcodes_h_l235_c7_1aa7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l235_c7_1aa7_cond,
result_stack_value_MUX_uxn_opcodes_h_l235_c7_1aa7_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l235_c7_1aa7_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l235_c7_1aa7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l235_c7_1aa7
result_is_opc_done_MUX_uxn_opcodes_h_l235_c7_1aa7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l235_c7_1aa7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l235_c7_1aa7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l235_c7_1aa7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l235_c7_1aa7_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l235_c7_1aa7
result_is_stack_read_MUX_uxn_opcodes_h_l235_c7_1aa7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l235_c7_1aa7_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l235_c7_1aa7_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l235_c7_1aa7_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l235_c7_1aa7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l235_c7_1aa7
result_is_stack_write_MUX_uxn_opcodes_h_l235_c7_1aa7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l235_c7_1aa7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l235_c7_1aa7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l235_c7_1aa7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l235_c7_1aa7_return_output);

-- result_pc_MUX_uxn_opcodes_h_l235_c7_1aa7
result_pc_MUX_uxn_opcodes_h_l235_c7_1aa7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l235_c7_1aa7_cond,
result_pc_MUX_uxn_opcodes_h_l235_c7_1aa7_iftrue,
result_pc_MUX_uxn_opcodes_h_l235_c7_1aa7_iffalse,
result_pc_MUX_uxn_opcodes_h_l235_c7_1aa7_return_output);

-- result_stack_address_MUX_uxn_opcodes_h_l235_c7_1aa7
result_stack_address_MUX_uxn_opcodes_h_l235_c7_1aa7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_MUX_uxn_opcodes_h_l235_c7_1aa7_cond,
result_stack_address_MUX_uxn_opcodes_h_l235_c7_1aa7_iftrue,
result_stack_address_MUX_uxn_opcodes_h_l235_c7_1aa7_iffalse,
result_stack_address_MUX_uxn_opcodes_h_l235_c7_1aa7_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l235_c7_1aa7
result_is_ram_read_MUX_uxn_opcodes_h_l235_c7_1aa7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l235_c7_1aa7_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l235_c7_1aa7_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l235_c7_1aa7_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l235_c7_1aa7_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l235_c7_1aa7
result_is_pc_updated_MUX_uxn_opcodes_h_l235_c7_1aa7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l235_c7_1aa7_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l235_c7_1aa7_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l235_c7_1aa7_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l235_c7_1aa7_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l235_c7_1aa7
result_ram_addr_MUX_uxn_opcodes_h_l235_c7_1aa7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l235_c7_1aa7_cond,
result_ram_addr_MUX_uxn_opcodes_h_l235_c7_1aa7_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l235_c7_1aa7_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l235_c7_1aa7_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l235_c7_1aa7
result_is_ram_write_MUX_uxn_opcodes_h_l235_c7_1aa7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l235_c7_1aa7_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l235_c7_1aa7_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l235_c7_1aa7_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l235_c7_1aa7_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l238_c21_901e
BIN_OP_PLUS_uxn_opcodes_h_l238_c21_901e : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l238_c21_901e_left,
BIN_OP_PLUS_uxn_opcodes_h_l238_c21_901e_right,
BIN_OP_PLUS_uxn_opcodes_h_l238_c21_901e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l240_c11_a09b
BIN_OP_EQ_uxn_opcodes_h_l240_c11_a09b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l240_c11_a09b_left,
BIN_OP_EQ_uxn_opcodes_h_l240_c11_a09b_right,
BIN_OP_EQ_uxn_opcodes_h_l240_c11_a09b_return_output);

-- lit2_tmp16_MUX_uxn_opcodes_h_l240_c7_f4b1
lit2_tmp16_MUX_uxn_opcodes_h_l240_c7_f4b1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
lit2_tmp16_MUX_uxn_opcodes_h_l240_c7_f4b1_cond,
lit2_tmp16_MUX_uxn_opcodes_h_l240_c7_f4b1_iftrue,
lit2_tmp16_MUX_uxn_opcodes_h_l240_c7_f4b1_iffalse,
lit2_tmp16_MUX_uxn_opcodes_h_l240_c7_f4b1_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l240_c7_f4b1
result_stack_value_MUX_uxn_opcodes_h_l240_c7_f4b1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l240_c7_f4b1_cond,
result_stack_value_MUX_uxn_opcodes_h_l240_c7_f4b1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l240_c7_f4b1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l240_c7_f4b1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l240_c7_f4b1
result_is_opc_done_MUX_uxn_opcodes_h_l240_c7_f4b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l240_c7_f4b1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l240_c7_f4b1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l240_c7_f4b1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l240_c7_f4b1_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l240_c7_f4b1
result_is_stack_read_MUX_uxn_opcodes_h_l240_c7_f4b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l240_c7_f4b1_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l240_c7_f4b1_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l240_c7_f4b1_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l240_c7_f4b1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l240_c7_f4b1
result_is_stack_write_MUX_uxn_opcodes_h_l240_c7_f4b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l240_c7_f4b1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l240_c7_f4b1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l240_c7_f4b1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l240_c7_f4b1_return_output);

-- result_pc_MUX_uxn_opcodes_h_l240_c7_f4b1
result_pc_MUX_uxn_opcodes_h_l240_c7_f4b1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l240_c7_f4b1_cond,
result_pc_MUX_uxn_opcodes_h_l240_c7_f4b1_iftrue,
result_pc_MUX_uxn_opcodes_h_l240_c7_f4b1_iffalse,
result_pc_MUX_uxn_opcodes_h_l240_c7_f4b1_return_output);

-- result_stack_address_MUX_uxn_opcodes_h_l240_c7_f4b1
result_stack_address_MUX_uxn_opcodes_h_l240_c7_f4b1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_MUX_uxn_opcodes_h_l240_c7_f4b1_cond,
result_stack_address_MUX_uxn_opcodes_h_l240_c7_f4b1_iftrue,
result_stack_address_MUX_uxn_opcodes_h_l240_c7_f4b1_iffalse,
result_stack_address_MUX_uxn_opcodes_h_l240_c7_f4b1_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l240_c7_f4b1
result_is_ram_read_MUX_uxn_opcodes_h_l240_c7_f4b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l240_c7_f4b1_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l240_c7_f4b1_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l240_c7_f4b1_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l240_c7_f4b1_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l240_c7_f4b1
result_is_pc_updated_MUX_uxn_opcodes_h_l240_c7_f4b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l240_c7_f4b1_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l240_c7_f4b1_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l240_c7_f4b1_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l240_c7_f4b1_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l240_c7_f4b1
result_ram_addr_MUX_uxn_opcodes_h_l240_c7_f4b1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l240_c7_f4b1_cond,
result_ram_addr_MUX_uxn_opcodes_h_l240_c7_f4b1_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l240_c7_f4b1_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l240_c7_f4b1_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l241_c3_1959
BIN_OP_OR_uxn_opcodes_h_l241_c3_1959 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l241_c3_1959_left,
BIN_OP_OR_uxn_opcodes_h_l241_c3_1959_right,
BIN_OP_OR_uxn_opcodes_h_l241_c3_1959_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l243_c15_5766
BIN_OP_PLUS_uxn_opcodes_h_l243_c15_5766 : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l243_c15_5766_left,
BIN_OP_PLUS_uxn_opcodes_h_l243_c15_5766_right,
BIN_OP_PLUS_uxn_opcodes_h_l243_c15_5766_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l245_c11_abdb
BIN_OP_EQ_uxn_opcodes_h_l245_c11_abdb : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l245_c11_abdb_left,
BIN_OP_EQ_uxn_opcodes_h_l245_c11_abdb_right,
BIN_OP_EQ_uxn_opcodes_h_l245_c11_abdb_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l245_c7_89f9
result_stack_value_MUX_uxn_opcodes_h_l245_c7_89f9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l245_c7_89f9_cond,
result_stack_value_MUX_uxn_opcodes_h_l245_c7_89f9_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l245_c7_89f9_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l245_c7_89f9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l245_c7_89f9
result_is_opc_done_MUX_uxn_opcodes_h_l245_c7_89f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l245_c7_89f9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l245_c7_89f9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l245_c7_89f9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l245_c7_89f9_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l245_c7_89f9
result_is_stack_read_MUX_uxn_opcodes_h_l245_c7_89f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l245_c7_89f9_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l245_c7_89f9_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l245_c7_89f9_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l245_c7_89f9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l245_c7_89f9
result_is_stack_write_MUX_uxn_opcodes_h_l245_c7_89f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l245_c7_89f9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l245_c7_89f9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l245_c7_89f9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l245_c7_89f9_return_output);

-- result_stack_address_MUX_uxn_opcodes_h_l245_c7_89f9
result_stack_address_MUX_uxn_opcodes_h_l245_c7_89f9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_MUX_uxn_opcodes_h_l245_c7_89f9_cond,
result_stack_address_MUX_uxn_opcodes_h_l245_c7_89f9_iftrue,
result_stack_address_MUX_uxn_opcodes_h_l245_c7_89f9_iffalse,
result_stack_address_MUX_uxn_opcodes_h_l245_c7_89f9_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l245_c7_89f9
result_is_ram_read_MUX_uxn_opcodes_h_l245_c7_89f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l245_c7_89f9_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l245_c7_89f9_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l245_c7_89f9_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l245_c7_89f9_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l245_c7_89f9
result_is_pc_updated_MUX_uxn_opcodes_h_l245_c7_89f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l245_c7_89f9_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l245_c7_89f9_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l245_c7_89f9_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l245_c7_89f9_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l245_c7_89f9
result_ram_addr_MUX_uxn_opcodes_h_l245_c7_89f9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l245_c7_89f9_cond,
result_ram_addr_MUX_uxn_opcodes_h_l245_c7_89f9_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l245_c7_89f9_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l245_c7_89f9_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l251_c26_ff03
BIN_OP_MINUS_uxn_opcodes_h_l251_c26_ff03 : entity work.BIN_OP_MINUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l251_c26_ff03_left,
BIN_OP_MINUS_uxn_opcodes_h_l251_c26_ff03_right,
BIN_OP_MINUS_uxn_opcodes_h_l251_c26_ff03_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l254_c11_82da
BIN_OP_EQ_uxn_opcodes_h_l254_c11_82da : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l254_c11_82da_left,
BIN_OP_EQ_uxn_opcodes_h_l254_c11_82da_right,
BIN_OP_EQ_uxn_opcodes_h_l254_c11_82da_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l254_c7_7d9e
result_stack_value_MUX_uxn_opcodes_h_l254_c7_7d9e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l254_c7_7d9e_cond,
result_stack_value_MUX_uxn_opcodes_h_l254_c7_7d9e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l254_c7_7d9e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l254_c7_7d9e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_7d9e
result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_7d9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_7d9e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_7d9e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_7d9e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_7d9e_return_output);

-- result_stack_address_MUX_uxn_opcodes_h_l254_c7_7d9e
result_stack_address_MUX_uxn_opcodes_h_l254_c7_7d9e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_MUX_uxn_opcodes_h_l254_c7_7d9e_cond,
result_stack_address_MUX_uxn_opcodes_h_l254_c7_7d9e_iftrue,
result_stack_address_MUX_uxn_opcodes_h_l254_c7_7d9e_iffalse,
result_stack_address_MUX_uxn_opcodes_h_l254_c7_7d9e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_7d9e
result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_7d9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_7d9e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_7d9e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_7d9e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_7d9e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_7d9e
result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_7d9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_7d9e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_7d9e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_7d9e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_7d9e_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l257_c26_330f
BIN_OP_MINUS_uxn_opcodes_h_l257_c26_330f : entity work.BIN_OP_MINUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l257_c26_330f_left,
BIN_OP_MINUS_uxn_opcodes_h_l257_c26_330f_right,
BIN_OP_MINUS_uxn_opcodes_h_l257_c26_330f_return_output);

-- CONST_SR_8_uxn_opcodes_h_l258_c34_6db1
CONST_SR_8_uxn_opcodes_h_l258_c34_6db1 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l258_c34_6db1_x,
CONST_SR_8_uxn_opcodes_h_l258_c34_6db1_return_output);

-- printf_uxn_opcodes_h_l266_c2_1672_uxn_opcodes_h_l266_c2_1672
printf_uxn_opcodes_h_l266_c2_1672_uxn_opcodes_h_l266_c2_1672 : entity work.printf_uxn_opcodes_h_l266_c2_1672_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l266_c2_1672_uxn_opcodes_h_l266_c2_1672_CLOCK_ENABLE,
printf_uxn_opcodes_h_l266_c2_1672_uxn_opcodes_h_l266_c2_1672_arg0,
printf_uxn_opcodes_h_l266_c2_1672_uxn_opcodes_h_l266_c2_1672_arg1,
printf_uxn_opcodes_h_l266_c2_1672_uxn_opcodes_h_l266_c2_1672_arg2,
printf_uxn_opcodes_h_l266_c2_1672_uxn_opcodes_h_l266_c2_1672_arg3,
printf_uxn_opcodes_h_l266_c2_1672_uxn_opcodes_h_l266_c2_1672_arg4);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 stack_index,
 pc,
 sp,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 lit2_tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l213_c6_7dce_return_output,
 lit2_tmp16_MUX_uxn_opcodes_h_l213_c2_90ce_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l213_c2_90ce_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l213_c2_90ce_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l213_c2_90ce_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l213_c2_90ce_return_output,
 result_pc_MUX_uxn_opcodes_h_l213_c2_90ce_return_output,
 result_sp_MUX_uxn_opcodes_h_l213_c2_90ce_return_output,
 result_stack_address_MUX_uxn_opcodes_h_l213_c2_90ce_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l213_c2_90ce_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l213_c2_90ce_return_output,
 result_is_sp_updated_MUX_uxn_opcodes_h_l213_c2_90ce_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l213_c2_90ce_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l213_c2_90ce_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l215_c15_e50f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l218_c11_450d_return_output,
 lit2_tmp16_MUX_uxn_opcodes_h_l218_c7_2f08_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l218_c7_2f08_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l218_c7_2f08_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l218_c7_2f08_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l218_c7_2f08_return_output,
 result_pc_MUX_uxn_opcodes_h_l218_c7_2f08_return_output,
 result_stack_address_MUX_uxn_opcodes_h_l218_c7_2f08_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l218_c7_2f08_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l218_c7_2f08_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l218_c7_2f08_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l218_c7_2f08_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l223_c11_746a_return_output,
 lit2_tmp16_MUX_uxn_opcodes_h_l223_c7_079f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l223_c7_079f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l223_c7_079f_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l223_c7_079f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l223_c7_079f_return_output,
 result_pc_MUX_uxn_opcodes_h_l223_c7_079f_return_output,
 result_stack_address_MUX_uxn_opcodes_h_l223_c7_079f_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l223_c7_079f_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l223_c7_079f_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l223_c7_079f_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l223_c7_079f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l228_c11_40cd_return_output,
 lit2_tmp16_MUX_uxn_opcodes_h_l228_c7_24e0_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l228_c7_24e0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l228_c7_24e0_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l228_c7_24e0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l228_c7_24e0_return_output,
 result_pc_MUX_uxn_opcodes_h_l228_c7_24e0_return_output,
 result_stack_address_MUX_uxn_opcodes_h_l228_c7_24e0_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l228_c7_24e0_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l228_c7_24e0_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l228_c7_24e0_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l228_c7_24e0_return_output,
 CONST_SL_8_uxn_opcodes_h_l230_c3_766c_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l233_c21_4d12_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l235_c11_701d_return_output,
 lit2_tmp16_MUX_uxn_opcodes_h_l235_c7_1aa7_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l235_c7_1aa7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l235_c7_1aa7_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l235_c7_1aa7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l235_c7_1aa7_return_output,
 result_pc_MUX_uxn_opcodes_h_l235_c7_1aa7_return_output,
 result_stack_address_MUX_uxn_opcodes_h_l235_c7_1aa7_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l235_c7_1aa7_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l235_c7_1aa7_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l235_c7_1aa7_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l235_c7_1aa7_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l238_c21_901e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l240_c11_a09b_return_output,
 lit2_tmp16_MUX_uxn_opcodes_h_l240_c7_f4b1_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l240_c7_f4b1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l240_c7_f4b1_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l240_c7_f4b1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l240_c7_f4b1_return_output,
 result_pc_MUX_uxn_opcodes_h_l240_c7_f4b1_return_output,
 result_stack_address_MUX_uxn_opcodes_h_l240_c7_f4b1_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l240_c7_f4b1_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l240_c7_f4b1_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l240_c7_f4b1_return_output,
 BIN_OP_OR_uxn_opcodes_h_l241_c3_1959_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l243_c15_5766_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l245_c11_abdb_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l245_c7_89f9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l245_c7_89f9_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l245_c7_89f9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l245_c7_89f9_return_output,
 result_stack_address_MUX_uxn_opcodes_h_l245_c7_89f9_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l245_c7_89f9_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l245_c7_89f9_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l245_c7_89f9_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l251_c26_ff03_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l254_c11_82da_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l254_c7_7d9e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_7d9e_return_output,
 result_stack_address_MUX_uxn_opcodes_h_l254_c7_7d9e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_7d9e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_7d9e_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l257_c26_330f_return_output,
 CONST_SR_8_uxn_opcodes_h_l258_c34_6db1_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_sp : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l213_c6_7dce_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l213_c6_7dce_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l213_c6_7dce_return_output : unsigned(0 downto 0);
 variable VAR_lit2_tmp16_MUX_uxn_opcodes_h_l213_c2_90ce_iftrue : unsigned(15 downto 0);
 variable VAR_lit2_tmp16_MUX_uxn_opcodes_h_l213_c2_90ce_iffalse : unsigned(15 downto 0);
 variable VAR_lit2_tmp16_MUX_uxn_opcodes_h_l218_c7_2f08_return_output : unsigned(15 downto 0);
 variable VAR_lit2_tmp16_MUX_uxn_opcodes_h_l213_c2_90ce_return_output : unsigned(15 downto 0);
 variable VAR_lit2_tmp16_MUX_uxn_opcodes_h_l213_c2_90ce_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l213_c2_90ce_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l213_c2_90ce_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l218_c7_2f08_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l213_c2_90ce_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l213_c2_90ce_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l213_c2_90ce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l213_c2_90ce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l218_c7_2f08_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l213_c2_90ce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l213_c2_90ce_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l213_c2_90ce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l213_c2_90ce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l218_c7_2f08_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l213_c2_90ce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l213_c2_90ce_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l213_c2_90ce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l213_c2_90ce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l218_c7_2f08_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l213_c2_90ce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l213_c2_90ce_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l213_c2_90ce_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l213_c2_90ce_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l218_c7_2f08_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l213_c2_90ce_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l213_c2_90ce_cond : unsigned(0 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l213_c2_90ce_iftrue : unsigned(7 downto 0);
 variable VAR_result_sp_uxn_opcodes_h_l215_c3_e580 : unsigned(7 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l213_c2_90ce_iffalse : unsigned(7 downto 0);
 variable VAR_result_sp_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_sp_d41d_uxn_opcodes_h_l213_c2_90ce_return_output : unsigned(7 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l213_c2_90ce_return_output : unsigned(7 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l213_c2_90ce_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l213_c2_90ce_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l213_c2_90ce_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l218_c7_2f08_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l213_c2_90ce_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l213_c2_90ce_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l213_c2_90ce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l213_c2_90ce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l218_c7_2f08_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l213_c2_90ce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l213_c2_90ce_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l213_c2_90ce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l213_c2_90ce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l218_c7_2f08_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l213_c2_90ce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l213_c2_90ce_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l213_c2_90ce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l213_c2_90ce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_updated_d41d_uxn_opcodes_h_l213_c2_90ce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l213_c2_90ce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l213_c2_90ce_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l213_c2_90ce_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l213_c2_90ce_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l218_c7_2f08_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l213_c2_90ce_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l213_c2_90ce_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l213_c2_90ce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l213_c2_90ce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l218_c7_2f08_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l213_c2_90ce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l213_c2_90ce_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l215_c15_e50f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l215_c15_e50f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l215_c15_e50f_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l218_c11_450d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l218_c11_450d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l218_c11_450d_return_output : unsigned(0 downto 0);
 variable VAR_lit2_tmp16_MUX_uxn_opcodes_h_l218_c7_2f08_iftrue : unsigned(15 downto 0);
 variable VAR_lit2_tmp16_MUX_uxn_opcodes_h_l218_c7_2f08_iffalse : unsigned(15 downto 0);
 variable VAR_lit2_tmp16_MUX_uxn_opcodes_h_l223_c7_079f_return_output : unsigned(15 downto 0);
 variable VAR_lit2_tmp16_MUX_uxn_opcodes_h_l218_c7_2f08_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l218_c7_2f08_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l218_c7_2f08_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l223_c7_079f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l218_c7_2f08_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l218_c7_2f08_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l218_c7_2f08_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l223_c7_079f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l218_c7_2f08_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l218_c7_2f08_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l218_c7_2f08_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l223_c7_079f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l218_c7_2f08_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l218_c7_2f08_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l218_c7_2f08_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l223_c7_079f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l218_c7_2f08_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l218_c7_2f08_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l218_c7_2f08_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l223_c7_079f_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l218_c7_2f08_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l218_c7_2f08_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l218_c7_2f08_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l223_c7_079f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l218_c7_2f08_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l218_c7_2f08_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l218_c7_2f08_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l223_c7_079f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l218_c7_2f08_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l218_c7_2f08_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l218_c7_2f08_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l223_c7_079f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l218_c7_2f08_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l218_c7_2f08_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l218_c7_2f08_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l223_c7_079f_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l218_c7_2f08_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l218_c7_2f08_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l218_c7_2f08_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l223_c7_079f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l218_c7_2f08_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l223_c11_746a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l223_c11_746a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l223_c11_746a_return_output : unsigned(0 downto 0);
 variable VAR_lit2_tmp16_MUX_uxn_opcodes_h_l223_c7_079f_iftrue : unsigned(15 downto 0);
 variable VAR_lit2_tmp16_MUX_uxn_opcodes_h_l223_c7_079f_iffalse : unsigned(15 downto 0);
 variable VAR_lit2_tmp16_MUX_uxn_opcodes_h_l228_c7_24e0_return_output : unsigned(15 downto 0);
 variable VAR_lit2_tmp16_MUX_uxn_opcodes_h_l223_c7_079f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l223_c7_079f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l223_c7_079f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l228_c7_24e0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l223_c7_079f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l223_c7_079f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l223_c7_079f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l228_c7_24e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l223_c7_079f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l223_c7_079f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l223_c7_079f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l228_c7_24e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l223_c7_079f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l223_c7_079f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l223_c7_079f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l228_c7_24e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l223_c7_079f_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l223_c7_079f_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l223_c7_079f_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l228_c7_24e0_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l223_c7_079f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l223_c7_079f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l223_c7_079f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l228_c7_24e0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l223_c7_079f_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l223_c7_079f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l223_c7_079f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l228_c7_24e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l223_c7_079f_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l223_c7_079f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l223_c7_079f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l228_c7_24e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l223_c7_079f_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l223_c7_079f_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l223_c7_079f_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l228_c7_24e0_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l223_c7_079f_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l223_c7_079f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l223_c7_079f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l228_c7_24e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l223_c7_079f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l228_c11_40cd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l228_c11_40cd_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l228_c11_40cd_return_output : unsigned(0 downto 0);
 variable VAR_lit2_tmp16_MUX_uxn_opcodes_h_l228_c7_24e0_iftrue : unsigned(15 downto 0);
 variable VAR_lit2_tmp16_MUX_uxn_opcodes_h_l228_c7_24e0_iffalse : unsigned(15 downto 0);
 variable VAR_lit2_tmp16_MUX_uxn_opcodes_h_l235_c7_1aa7_return_output : unsigned(15 downto 0);
 variable VAR_lit2_tmp16_MUX_uxn_opcodes_h_l228_c7_24e0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l228_c7_24e0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l228_c7_24e0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l235_c7_1aa7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l228_c7_24e0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l228_c7_24e0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l228_c7_24e0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l235_c7_1aa7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l228_c7_24e0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l228_c7_24e0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l228_c7_24e0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l235_c7_1aa7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l228_c7_24e0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l228_c7_24e0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l228_c7_24e0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l235_c7_1aa7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l228_c7_24e0_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l228_c7_24e0_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l228_c7_24e0_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l235_c7_1aa7_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l228_c7_24e0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l228_c7_24e0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l228_c7_24e0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l235_c7_1aa7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l228_c7_24e0_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l228_c7_24e0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l228_c7_24e0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l235_c7_1aa7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l228_c7_24e0_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l228_c7_24e0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l228_c7_24e0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l235_c7_1aa7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l228_c7_24e0_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l228_c7_24e0_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l233_c3_aed7 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l228_c7_24e0_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l235_c7_1aa7_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l228_c7_24e0_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l228_c7_24e0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l228_c7_24e0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l235_c7_1aa7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l228_c7_24e0_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l230_c3_766c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l230_c3_766c_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l233_c21_4d12_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l233_c21_4d12_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l233_c21_4d12_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l235_c11_701d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l235_c11_701d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l235_c11_701d_return_output : unsigned(0 downto 0);
 variable VAR_lit2_tmp16_MUX_uxn_opcodes_h_l235_c7_1aa7_iftrue : unsigned(15 downto 0);
 variable VAR_lit2_tmp16_MUX_uxn_opcodes_h_l235_c7_1aa7_iffalse : unsigned(15 downto 0);
 variable VAR_lit2_tmp16_MUX_uxn_opcodes_h_l240_c7_f4b1_return_output : unsigned(15 downto 0);
 variable VAR_lit2_tmp16_MUX_uxn_opcodes_h_l235_c7_1aa7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l235_c7_1aa7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l235_c7_1aa7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l240_c7_f4b1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l235_c7_1aa7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l235_c7_1aa7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l235_c7_1aa7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l240_c7_f4b1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l235_c7_1aa7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l235_c7_1aa7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l235_c7_1aa7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l240_c7_f4b1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l235_c7_1aa7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l235_c7_1aa7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l235_c7_1aa7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l240_c7_f4b1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l235_c7_1aa7_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l235_c7_1aa7_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l235_c7_1aa7_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l240_c7_f4b1_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l235_c7_1aa7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l235_c7_1aa7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l235_c7_1aa7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l240_c7_f4b1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l235_c7_1aa7_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l235_c7_1aa7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l235_c7_1aa7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l240_c7_f4b1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l235_c7_1aa7_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l235_c7_1aa7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l235_c7_1aa7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l240_c7_f4b1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l235_c7_1aa7_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l235_c7_1aa7_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l238_c3_9d0f : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l235_c7_1aa7_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l240_c7_f4b1_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l235_c7_1aa7_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l235_c7_1aa7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l235_c7_1aa7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l235_c7_1aa7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l238_c21_901e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l238_c21_901e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l238_c21_901e_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l240_c11_a09b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l240_c11_a09b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l240_c11_a09b_return_output : unsigned(0 downto 0);
 variable VAR_lit2_tmp16_MUX_uxn_opcodes_h_l240_c7_f4b1_iftrue : unsigned(15 downto 0);
 variable VAR_lit2_tmp16_MUX_uxn_opcodes_h_l240_c7_f4b1_iffalse : unsigned(15 downto 0);
 variable VAR_lit2_tmp16_MUX_uxn_opcodes_h_l240_c7_f4b1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l240_c7_f4b1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l240_c7_f4b1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l245_c7_89f9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l240_c7_f4b1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l240_c7_f4b1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l240_c7_f4b1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l245_c7_89f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l240_c7_f4b1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l240_c7_f4b1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l240_c7_f4b1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l245_c7_89f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l240_c7_f4b1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l240_c7_f4b1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l240_c7_f4b1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l245_c7_89f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l240_c7_f4b1_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l240_c7_f4b1_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_uxn_opcodes_h_l243_c3_6a9b : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l240_c7_f4b1_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l240_c7_f4b1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l240_c7_f4b1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l240_c7_f4b1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l245_c7_89f9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l240_c7_f4b1_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l240_c7_f4b1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l240_c7_f4b1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l245_c7_89f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l240_c7_f4b1_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l240_c7_f4b1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l240_c7_f4b1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l245_c7_89f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l240_c7_f4b1_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l240_c7_f4b1_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l240_c7_f4b1_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l245_c7_89f9_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l240_c7_f4b1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l241_c3_1959_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l241_c3_1959_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l241_c3_1959_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l243_c15_5766_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l243_c15_5766_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l243_c15_5766_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c11_abdb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c11_abdb_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c11_abdb_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l245_c7_89f9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l245_c7_89f9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l254_c7_7d9e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l245_c7_89f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l245_c7_89f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l245_c7_89f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_7d9e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l245_c7_89f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l245_c7_89f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l245_c7_89f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_7d9e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l245_c7_89f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l245_c7_89f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l245_c7_89f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_7d9e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l245_c7_89f9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l245_c7_89f9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l245_c7_89f9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l254_c7_7d9e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l245_c7_89f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l245_c7_89f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l245_c7_89f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l245_c7_89f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l245_c7_89f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l245_c7_89f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l245_c7_89f9_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l245_c7_89f9_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l247_c3_e5c9 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l245_c7_89f9_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l245_c7_89f9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l251_c26_ff03_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l251_c26_ff03_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l251_c26_ff03_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l252_c24_8203_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l254_c11_82da_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l254_c11_82da_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l254_c11_82da_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l254_c7_7d9e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l254_c7_7d9e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l254_c7_7d9e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_7d9e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_7d9e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_7d9e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l254_c7_7d9e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l254_c7_7d9e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_uxn_opcodes_h_l262_c3_309f : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l254_c7_7d9e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_7d9e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_7d9e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_7d9e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_7d9e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_7d9e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_7d9e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l257_c26_330f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l257_c26_330f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l257_c26_330f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l258_c34_6db1_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l258_c34_6db1_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l258_c24_e54e_return_output : unsigned(7 downto 0);
 variable VAR_printf_uxn_opcodes_h_l266_c2_1672_uxn_opcodes_h_l266_c2_1672_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l266_c2_1672_uxn_opcodes_h_l266_c2_1672_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_opcodes_h_l266_c2_1672_uxn_opcodes_h_l266_c2_1672_arg1 : unsigned(31 downto 0);
 variable VAR_printf_uxn_opcodes_h_l266_c2_1672_uxn_opcodes_h_l266_c2_1672_arg2 : unsigned(31 downto 0);
 variable VAR_printf_uxn_opcodes_h_l266_c2_1672_uxn_opcodes_h_l266_c2_1672_arg3 : unsigned(31 downto 0);
 variable VAR_printf_uxn_opcodes_h_l266_c2_1672_uxn_opcodes_h_l266_c2_1672_arg4 : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l254_l218_l213_l240_l235_l228_l223_DUPLICATE_9453_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l254_l218_l213_l240_l235_l228_l223_DUPLICATE_671b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l218_l213_l240_l235_l228_l223_DUPLICATE_9f3b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l218_l213_l240_l235_l228_l223_DUPLICATE_9711_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_d41d_uxn_opcodes_h_l218_l213_l240_l235_l228_l223_DUPLICATE_2457_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l213_l240_l245_DUPLICATE_038b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l218_l245_l213_l235_l228_l223_DUPLICATE_fee9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l213_l240_l245_DUPLICATE_cac7_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l213_l235_DUPLICATE_2b2f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l254_l218_l245_l240_l235_l228_l223_DUPLICATE_26de_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l241_l229_DUPLICATE_61ef_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4937_uxn_opcodes_h_l268_l208_DUPLICATE_7ddb_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_lit2_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_lit2_tmp16 := lit2_tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l213_c2_90ce_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l254_c11_82da_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l213_c6_7dce_right := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l245_c7_89f9_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l233_c21_4d12_right := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_7d9e_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l245_c7_89f9_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l215_c15_e50f_right := to_unsigned(2, 2);
     VAR_result_ram_addr_uxn_opcodes_h_l247_c3_e5c9 := resize(to_unsigned(0, 1), 16);
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l245_c7_89f9_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l247_c3_e5c9;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l235_c7_1aa7_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l235_c11_701d_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l218_c11_450d_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l223_c11_746a_right := to_unsigned(2, 2);
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l257_c26_330f_right := to_unsigned(2, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l235_c7_1aa7_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l245_c7_89f9_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l243_c15_5766_right := to_unsigned(2, 2);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l228_c7_24e0_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l218_c7_2f08_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c11_abdb_right := to_unsigned(6, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_7d9e_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l251_c26_ff03_right := to_unsigned(1, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l223_c7_079f_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l238_c21_901e_right := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l228_c7_24e0_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l223_c7_079f_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l218_c7_2f08_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l240_c11_a09b_right := to_unsigned(5, 3);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l245_c7_89f9_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_7d9e_iffalse := to_unsigned(0, 1);
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l213_c2_90ce_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_uxn_opcodes_h_l262_c3_309f := resize(to_unsigned(0, 1), 8);
     VAR_result_stack_address_MUX_uxn_opcodes_h_l254_c7_7d9e_iffalse := VAR_result_stack_address_uxn_opcodes_h_l262_c3_309f;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_7d9e_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l228_c11_40cd_right := to_unsigned(3, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l240_c7_f4b1_iftrue := to_unsigned(1, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_stack_index := stack_index;
     VAR_pc := pc;
     VAR_sp := sp;
     VAR_previous_stack_read := previous_stack_read;
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_printf_uxn_opcodes_h_l266_c2_1672_uxn_opcodes_h_l266_c2_1672_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_OR_uxn_opcodes_h_l241_c3_1959_left := lit2_tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l258_c34_6db1_x := lit2_tmp16;
     VAR_lit2_tmp16_MUX_uxn_opcodes_h_l213_c2_90ce_iftrue := lit2_tmp16;
     VAR_lit2_tmp16_MUX_uxn_opcodes_h_l218_c7_2f08_iftrue := lit2_tmp16;
     VAR_lit2_tmp16_MUX_uxn_opcodes_h_l223_c7_079f_iftrue := lit2_tmp16;
     VAR_lit2_tmp16_MUX_uxn_opcodes_h_l235_c7_1aa7_iftrue := lit2_tmp16;
     VAR_lit2_tmp16_MUX_uxn_opcodes_h_l240_c7_f4b1_iffalse := lit2_tmp16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l233_c21_4d12_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l238_c21_901e_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l243_c15_5766_left := VAR_pc;
     VAR_printf_uxn_opcodes_h_l266_c2_1672_uxn_opcodes_h_l266_c2_1672_arg2 := resize(VAR_pc, 32);
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l218_c7_2f08_iftrue := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l223_c7_079f_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l213_c6_7dce_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l218_c11_450d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l223_c11_746a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l228_c11_40cd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l235_c11_701d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l240_c11_a09b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c11_abdb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l254_c11_82da_left := VAR_phase;
     VAR_printf_uxn_opcodes_h_l266_c2_1672_uxn_opcodes_h_l266_c2_1672_arg0 := resize(VAR_phase, 32);
     VAR_printf_uxn_opcodes_h_l266_c2_1672_uxn_opcodes_h_l266_c2_1672_arg3 := resize(VAR_previous_ram_read, 32);
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l251_c26_ff03_left := VAR_sp;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l257_c26_330f_left := VAR_sp;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l215_c15_e50f_left := VAR_sp;
     VAR_printf_uxn_opcodes_h_l266_c2_1672_uxn_opcodes_h_l266_c2_1672_arg1 := resize(VAR_sp, 32);
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l218_l245_l213_l235_l228_l223_DUPLICATE_fee9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l218_l245_l213_l235_l228_l223_DUPLICATE_fee9_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l235_c11_701d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l235_c11_701d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l235_c11_701d_left;
     BIN_OP_EQ_uxn_opcodes_h_l235_c11_701d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l235_c11_701d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l235_c11_701d_return_output := BIN_OP_EQ_uxn_opcodes_h_l235_c11_701d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l240_c11_a09b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l240_c11_a09b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l240_c11_a09b_left;
     BIN_OP_EQ_uxn_opcodes_h_l240_c11_a09b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l240_c11_a09b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l240_c11_a09b_return_output := BIN_OP_EQ_uxn_opcodes_h_l240_c11_a09b_return_output;

     -- BIN_OP_MINUS[uxn_opcodes_h_l257_c26_330f] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l257_c26_330f_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l257_c26_330f_left;
     BIN_OP_MINUS_uxn_opcodes_h_l257_c26_330f_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l257_c26_330f_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l257_c26_330f_return_output := BIN_OP_MINUS_uxn_opcodes_h_l257_c26_330f_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l238_c21_901e] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l238_c21_901e_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l238_c21_901e_left;
     BIN_OP_PLUS_uxn_opcodes_h_l238_c21_901e_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l238_c21_901e_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l238_c21_901e_return_output := BIN_OP_PLUS_uxn_opcodes_h_l238_c21_901e_return_output;

     -- result_sp_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_sp_d41d[uxn_opcodes_h_l213_c2_90ce] LATENCY=0
     VAR_result_sp_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_sp_d41d_uxn_opcodes_h_l213_c2_90ce_return_output := result.sp;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l254_l218_l245_l240_l235_l228_l223_DUPLICATE_26de LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l254_l218_l245_l240_l235_l228_l223_DUPLICATE_26de_return_output := result.is_opc_done;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l241_l229_DUPLICATE_61ef LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l241_l229_DUPLICATE_61ef_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l218_l213_l240_l235_l228_l223_DUPLICATE_9f3b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l218_l213_l240_l235_l228_l223_DUPLICATE_9f3b_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_d41d_uxn_opcodes_h_l218_l213_l240_l235_l228_l223_DUPLICATE_2457 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_d41d_uxn_opcodes_h_l218_l213_l240_l235_l228_l223_DUPLICATE_2457_return_output := result.stack_address;

     -- BIN_OP_EQ[uxn_opcodes_h_l245_c11_abdb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l245_c11_abdb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c11_abdb_left;
     BIN_OP_EQ_uxn_opcodes_h_l245_c11_abdb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c11_abdb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c11_abdb_return_output := BIN_OP_EQ_uxn_opcodes_h_l245_c11_abdb_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l243_c15_5766] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l243_c15_5766_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l243_c15_5766_left;
     BIN_OP_PLUS_uxn_opcodes_h_l243_c15_5766_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l243_c15_5766_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l243_c15_5766_return_output := BIN_OP_PLUS_uxn_opcodes_h_l243_c15_5766_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l215_c15_e50f] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l215_c15_e50f_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l215_c15_e50f_left;
     BIN_OP_PLUS_uxn_opcodes_h_l215_c15_e50f_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l215_c15_e50f_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l215_c15_e50f_return_output := BIN_OP_PLUS_uxn_opcodes_h_l215_c15_e50f_return_output;

     -- result_is_sp_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_updated_d41d[uxn_opcodes_h_l213_c2_90ce] LATENCY=0
     VAR_result_is_sp_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_updated_d41d_uxn_opcodes_h_l213_c2_90ce_return_output := result.is_sp_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l254_c11_82da] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l254_c11_82da_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l254_c11_82da_left;
     BIN_OP_EQ_uxn_opcodes_h_l254_c11_82da_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l254_c11_82da_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l254_c11_82da_return_output := BIN_OP_EQ_uxn_opcodes_h_l254_c11_82da_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l223_c11_746a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l223_c11_746a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l223_c11_746a_left;
     BIN_OP_EQ_uxn_opcodes_h_l223_c11_746a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l223_c11_746a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l223_c11_746a_return_output := BIN_OP_EQ_uxn_opcodes_h_l223_c11_746a_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l233_c21_4d12] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l233_c21_4d12_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l233_c21_4d12_left;
     BIN_OP_PLUS_uxn_opcodes_h_l233_c21_4d12_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l233_c21_4d12_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l233_c21_4d12_return_output := BIN_OP_PLUS_uxn_opcodes_h_l233_c21_4d12_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l254_l218_l213_l240_l235_l228_l223_DUPLICATE_671b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l254_l218_l213_l240_l235_l228_l223_DUPLICATE_671b_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l213_l235_DUPLICATE_2b2f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l213_l235_DUPLICATE_2b2f_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l213_l240_l245_DUPLICATE_cac7 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l213_l240_l245_DUPLICATE_cac7_return_output := result.ram_addr;

     -- BIN_OP_EQ[uxn_opcodes_h_l213_c6_7dce] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l213_c6_7dce_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l213_c6_7dce_left;
     BIN_OP_EQ_uxn_opcodes_h_l213_c6_7dce_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l213_c6_7dce_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l213_c6_7dce_return_output := BIN_OP_EQ_uxn_opcodes_h_l213_c6_7dce_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l252_c24_8203] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l252_c24_8203_return_output := CAST_TO_uint8_t_uint16_t(
     lit2_tmp16);

     -- BIN_OP_EQ[uxn_opcodes_h_l218_c11_450d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l218_c11_450d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l218_c11_450d_left;
     BIN_OP_EQ_uxn_opcodes_h_l218_c11_450d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l218_c11_450d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l218_c11_450d_return_output := BIN_OP_EQ_uxn_opcodes_h_l218_c11_450d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l213_l240_l245_DUPLICATE_038b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l213_l240_l245_DUPLICATE_038b_return_output := result.is_ram_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l228_c11_40cd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l228_c11_40cd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l228_c11_40cd_left;
     BIN_OP_EQ_uxn_opcodes_h_l228_c11_40cd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l228_c11_40cd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l228_c11_40cd_return_output := BIN_OP_EQ_uxn_opcodes_h_l228_c11_40cd_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l258_c34_6db1] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l258_c34_6db1_x <= VAR_CONST_SR_8_uxn_opcodes_h_l258_c34_6db1_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l258_c34_6db1_return_output := CONST_SR_8_uxn_opcodes_h_l258_c34_6db1_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l218_l213_l240_l235_l228_l223_DUPLICATE_9711 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l218_l213_l240_l235_l228_l223_DUPLICATE_9711_return_output := result.pc;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l254_l218_l213_l240_l235_l228_l223_DUPLICATE_9453 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l254_l218_l213_l240_l235_l228_l223_DUPLICATE_9453_return_output := result.stack_value;

     -- BIN_OP_MINUS[uxn_opcodes_h_l251_c26_ff03] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l251_c26_ff03_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l251_c26_ff03_left;
     BIN_OP_MINUS_uxn_opcodes_h_l251_c26_ff03_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l251_c26_ff03_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l251_c26_ff03_return_output := BIN_OP_MINUS_uxn_opcodes_h_l251_c26_ff03_return_output;

     -- Submodule level 1
     VAR_lit2_tmp16_MUX_uxn_opcodes_h_l213_c2_90ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l213_c6_7dce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l213_c2_90ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l213_c6_7dce_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l213_c2_90ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l213_c6_7dce_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l213_c2_90ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l213_c6_7dce_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l213_c2_90ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l213_c6_7dce_return_output;
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l213_c2_90ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l213_c6_7dce_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l213_c2_90ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l213_c6_7dce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l213_c2_90ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l213_c6_7dce_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l213_c2_90ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l213_c6_7dce_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l213_c2_90ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l213_c6_7dce_return_output;
     VAR_result_sp_MUX_uxn_opcodes_h_l213_c2_90ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l213_c6_7dce_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l213_c2_90ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l213_c6_7dce_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l213_c2_90ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l213_c6_7dce_return_output;
     VAR_lit2_tmp16_MUX_uxn_opcodes_h_l218_c7_2f08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l218_c11_450d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l218_c7_2f08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l218_c11_450d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l218_c7_2f08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l218_c11_450d_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l218_c7_2f08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l218_c11_450d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l218_c7_2f08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l218_c11_450d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l218_c7_2f08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l218_c11_450d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l218_c7_2f08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l218_c11_450d_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l218_c7_2f08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l218_c11_450d_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l218_c7_2f08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l218_c11_450d_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l218_c7_2f08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l218_c11_450d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l218_c7_2f08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l218_c11_450d_return_output;
     VAR_lit2_tmp16_MUX_uxn_opcodes_h_l223_c7_079f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l223_c11_746a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l223_c7_079f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l223_c11_746a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l223_c7_079f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l223_c11_746a_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l223_c7_079f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l223_c11_746a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l223_c7_079f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l223_c11_746a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l223_c7_079f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l223_c11_746a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l223_c7_079f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l223_c11_746a_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l223_c7_079f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l223_c11_746a_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l223_c7_079f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l223_c11_746a_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l223_c7_079f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l223_c11_746a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l223_c7_079f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l223_c11_746a_return_output;
     VAR_lit2_tmp16_MUX_uxn_opcodes_h_l228_c7_24e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l228_c11_40cd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l228_c7_24e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l228_c11_40cd_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l228_c7_24e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l228_c11_40cd_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l228_c7_24e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l228_c11_40cd_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l228_c7_24e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l228_c11_40cd_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l228_c7_24e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l228_c11_40cd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l228_c7_24e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l228_c11_40cd_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l228_c7_24e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l228_c11_40cd_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l228_c7_24e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l228_c11_40cd_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l228_c7_24e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l228_c11_40cd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l228_c7_24e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l228_c11_40cd_return_output;
     VAR_lit2_tmp16_MUX_uxn_opcodes_h_l235_c7_1aa7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l235_c11_701d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l235_c7_1aa7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l235_c11_701d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l235_c7_1aa7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l235_c11_701d_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l235_c7_1aa7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l235_c11_701d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l235_c7_1aa7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l235_c11_701d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l235_c7_1aa7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l235_c11_701d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l235_c7_1aa7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l235_c11_701d_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l235_c7_1aa7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l235_c11_701d_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l235_c7_1aa7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l235_c11_701d_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l235_c7_1aa7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l235_c11_701d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l235_c7_1aa7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l235_c11_701d_return_output;
     VAR_lit2_tmp16_MUX_uxn_opcodes_h_l240_c7_f4b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l240_c11_a09b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l240_c7_f4b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l240_c11_a09b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l240_c7_f4b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l240_c11_a09b_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l240_c7_f4b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l240_c11_a09b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l240_c7_f4b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l240_c11_a09b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l240_c7_f4b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l240_c11_a09b_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l240_c7_f4b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l240_c11_a09b_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l240_c7_f4b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l240_c11_a09b_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l240_c7_f4b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l240_c11_a09b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l240_c7_f4b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l240_c11_a09b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l245_c7_89f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c11_abdb_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l245_c7_89f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c11_abdb_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l245_c7_89f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c11_abdb_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l245_c7_89f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c11_abdb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l245_c7_89f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c11_abdb_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l245_c7_89f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c11_abdb_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l245_c7_89f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c11_abdb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l245_c7_89f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c11_abdb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_7d9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l254_c11_82da_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_7d9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l254_c11_82da_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_7d9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l254_c11_82da_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l254_c7_7d9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l254_c11_82da_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l254_c7_7d9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l254_c11_82da_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l245_c7_89f9_iftrue := VAR_BIN_OP_MINUS_uxn_opcodes_h_l251_c26_ff03_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l254_c7_7d9e_iftrue := VAR_BIN_OP_MINUS_uxn_opcodes_h_l257_c26_330f_return_output;
     VAR_result_sp_uxn_opcodes_h_l215_c3_e580 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l215_c15_e50f_return_output, 8);
     VAR_result_ram_addr_uxn_opcodes_h_l233_c3_aed7 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l233_c21_4d12_return_output, 16);
     VAR_result_ram_addr_uxn_opcodes_h_l238_c3_9d0f := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l238_c21_901e_return_output, 16);
     VAR_result_pc_uxn_opcodes_h_l243_c3_6a9b := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l243_c15_5766_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l241_c3_1959_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l241_l229_DUPLICATE_61ef_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l230_c3_766c_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l241_l229_DUPLICATE_61ef_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l245_c7_89f9_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l252_c24_8203_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l213_c2_90ce_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l218_l213_l240_l235_l228_l223_DUPLICATE_9711_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l218_c7_2f08_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l218_l213_l240_l235_l228_l223_DUPLICATE_9711_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l223_c7_079f_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l218_l213_l240_l235_l228_l223_DUPLICATE_9711_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l228_c7_24e0_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l218_l213_l240_l235_l228_l223_DUPLICATE_9711_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l235_c7_1aa7_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l218_l213_l240_l235_l228_l223_DUPLICATE_9711_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l240_c7_f4b1_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l218_l213_l240_l235_l228_l223_DUPLICATE_9711_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l213_c2_90ce_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l213_l240_l245_DUPLICATE_cac7_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l240_c7_f4b1_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l213_l240_l245_DUPLICATE_cac7_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l245_c7_89f9_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l213_l240_l245_DUPLICATE_cac7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l218_c7_2f08_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l254_l218_l245_l240_l235_l228_l223_DUPLICATE_26de_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l223_c7_079f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l254_l218_l245_l240_l235_l228_l223_DUPLICATE_26de_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l228_c7_24e0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l254_l218_l245_l240_l235_l228_l223_DUPLICATE_26de_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l235_c7_1aa7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l254_l218_l245_l240_l235_l228_l223_DUPLICATE_26de_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l240_c7_f4b1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l254_l218_l245_l240_l235_l228_l223_DUPLICATE_26de_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l245_c7_89f9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l254_l218_l245_l240_l235_l228_l223_DUPLICATE_26de_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_7d9e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l254_l218_l245_l240_l235_l228_l223_DUPLICATE_26de_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l213_c2_90ce_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l218_l245_l213_l235_l228_l223_DUPLICATE_fee9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l218_c7_2f08_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l218_l245_l213_l235_l228_l223_DUPLICATE_fee9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l223_c7_079f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l218_l245_l213_l235_l228_l223_DUPLICATE_fee9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l228_c7_24e0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l218_l245_l213_l235_l228_l223_DUPLICATE_fee9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l235_c7_1aa7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l218_l245_l213_l235_l228_l223_DUPLICATE_fee9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l245_c7_89f9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l218_l245_l213_l235_l228_l223_DUPLICATE_fee9_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l213_c2_90ce_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l213_l240_l245_DUPLICATE_038b_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l240_c7_f4b1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l213_l240_l245_DUPLICATE_038b_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l245_c7_89f9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l213_l240_l245_DUPLICATE_038b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l213_c2_90ce_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l213_l235_DUPLICATE_2b2f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l235_c7_1aa7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l213_l235_DUPLICATE_2b2f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l213_c2_90ce_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l254_l218_l213_l240_l235_l228_l223_DUPLICATE_671b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l218_c7_2f08_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l254_l218_l213_l240_l235_l228_l223_DUPLICATE_671b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l223_c7_079f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l254_l218_l213_l240_l235_l228_l223_DUPLICATE_671b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l228_c7_24e0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l254_l218_l213_l240_l235_l228_l223_DUPLICATE_671b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l235_c7_1aa7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l254_l218_l213_l240_l235_l228_l223_DUPLICATE_671b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l240_c7_f4b1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l254_l218_l213_l240_l235_l228_l223_DUPLICATE_671b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_7d9e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l254_l218_l213_l240_l235_l228_l223_DUPLICATE_671b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l213_c2_90ce_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l218_l213_l240_l235_l228_l223_DUPLICATE_9f3b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l218_c7_2f08_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l218_l213_l240_l235_l228_l223_DUPLICATE_9f3b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l223_c7_079f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l218_l213_l240_l235_l228_l223_DUPLICATE_9f3b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l228_c7_24e0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l218_l213_l240_l235_l228_l223_DUPLICATE_9f3b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l235_c7_1aa7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l218_l213_l240_l235_l228_l223_DUPLICATE_9f3b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l240_c7_f4b1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l218_l213_l240_l235_l228_l223_DUPLICATE_9f3b_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l213_c2_90ce_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_d41d_uxn_opcodes_h_l218_l213_l240_l235_l228_l223_DUPLICATE_2457_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l218_c7_2f08_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_d41d_uxn_opcodes_h_l218_l213_l240_l235_l228_l223_DUPLICATE_2457_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l223_c7_079f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_d41d_uxn_opcodes_h_l218_l213_l240_l235_l228_l223_DUPLICATE_2457_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l228_c7_24e0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_d41d_uxn_opcodes_h_l218_l213_l240_l235_l228_l223_DUPLICATE_2457_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l235_c7_1aa7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_d41d_uxn_opcodes_h_l218_l213_l240_l235_l228_l223_DUPLICATE_2457_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l240_c7_f4b1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_d41d_uxn_opcodes_h_l218_l213_l240_l235_l228_l223_DUPLICATE_2457_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l213_c2_90ce_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l254_l218_l213_l240_l235_l228_l223_DUPLICATE_9453_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l218_c7_2f08_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l254_l218_l213_l240_l235_l228_l223_DUPLICATE_9453_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l223_c7_079f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l254_l218_l213_l240_l235_l228_l223_DUPLICATE_9453_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l228_c7_24e0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l254_l218_l213_l240_l235_l228_l223_DUPLICATE_9453_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l235_c7_1aa7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l254_l218_l213_l240_l235_l228_l223_DUPLICATE_9453_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l240_c7_f4b1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l254_l218_l213_l240_l235_l228_l223_DUPLICATE_9453_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l254_c7_7d9e_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l254_l218_l213_l240_l235_l228_l223_DUPLICATE_9453_return_output;
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l213_c2_90ce_iffalse := VAR_result_is_sp_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_updated_d41d_uxn_opcodes_h_l213_c2_90ce_return_output;
     VAR_result_sp_MUX_uxn_opcodes_h_l213_c2_90ce_iffalse := VAR_result_sp_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_sp_d41d_uxn_opcodes_h_l213_c2_90ce_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l240_c7_f4b1_iftrue := VAR_result_pc_uxn_opcodes_h_l243_c3_6a9b;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l228_c7_24e0_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l233_c3_aed7;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l235_c7_1aa7_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l238_c3_9d0f;
     VAR_result_sp_MUX_uxn_opcodes_h_l213_c2_90ce_iftrue := VAR_result_sp_uxn_opcodes_h_l215_c3_e580;
     -- result_ram_addr_MUX[uxn_opcodes_h_l245_c7_89f9] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l245_c7_89f9_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l245_c7_89f9_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l245_c7_89f9_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l245_c7_89f9_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l245_c7_89f9_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l245_c7_89f9_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l245_c7_89f9_return_output := result_ram_addr_MUX_uxn_opcodes_h_l245_c7_89f9_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l230_c3_766c] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l230_c3_766c_x <= VAR_CONST_SL_8_uxn_opcodes_h_l230_c3_766c_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l230_c3_766c_return_output := CONST_SL_8_uxn_opcodes_h_l230_c3_766c_return_output;

     -- result_is_sp_updated_MUX[uxn_opcodes_h_l213_c2_90ce] LATENCY=0
     -- Inputs
     result_is_sp_updated_MUX_uxn_opcodes_h_l213_c2_90ce_cond <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l213_c2_90ce_cond;
     result_is_sp_updated_MUX_uxn_opcodes_h_l213_c2_90ce_iftrue <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l213_c2_90ce_iftrue;
     result_is_sp_updated_MUX_uxn_opcodes_h_l213_c2_90ce_iffalse <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l213_c2_90ce_iffalse;
     -- Outputs
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l213_c2_90ce_return_output := result_is_sp_updated_MUX_uxn_opcodes_h_l213_c2_90ce_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l254_c7_7d9e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_7d9e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_7d9e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_7d9e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_7d9e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_7d9e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_7d9e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_7d9e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_7d9e_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l241_c3_1959] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l241_c3_1959_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l241_c3_1959_left;
     BIN_OP_OR_uxn_opcodes_h_l241_c3_1959_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l241_c3_1959_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l241_c3_1959_return_output := BIN_OP_OR_uxn_opcodes_h_l241_c3_1959_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l240_c7_f4b1] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l240_c7_f4b1_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l240_c7_f4b1_cond;
     result_pc_MUX_uxn_opcodes_h_l240_c7_f4b1_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l240_c7_f4b1_iftrue;
     result_pc_MUX_uxn_opcodes_h_l240_c7_f4b1_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l240_c7_f4b1_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l240_c7_f4b1_return_output := result_pc_MUX_uxn_opcodes_h_l240_c7_f4b1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l254_c7_7d9e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_7d9e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_7d9e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_7d9e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_7d9e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_7d9e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_7d9e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_7d9e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_7d9e_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l258_c24_e54e] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l258_c24_e54e_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l258_c34_6db1_return_output);

     -- result_is_ram_read_MUX[uxn_opcodes_h_l245_c7_89f9] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l245_c7_89f9_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l245_c7_89f9_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l245_c7_89f9_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l245_c7_89f9_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l245_c7_89f9_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l245_c7_89f9_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l245_c7_89f9_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l245_c7_89f9_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l254_c7_7d9e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_7d9e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_7d9e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_7d9e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_7d9e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_7d9e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_7d9e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_7d9e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_7d9e_return_output;

     -- result_sp_MUX[uxn_opcodes_h_l213_c2_90ce] LATENCY=0
     -- Inputs
     result_sp_MUX_uxn_opcodes_h_l213_c2_90ce_cond <= VAR_result_sp_MUX_uxn_opcodes_h_l213_c2_90ce_cond;
     result_sp_MUX_uxn_opcodes_h_l213_c2_90ce_iftrue <= VAR_result_sp_MUX_uxn_opcodes_h_l213_c2_90ce_iftrue;
     result_sp_MUX_uxn_opcodes_h_l213_c2_90ce_iffalse <= VAR_result_sp_MUX_uxn_opcodes_h_l213_c2_90ce_iffalse;
     -- Outputs
     VAR_result_sp_MUX_uxn_opcodes_h_l213_c2_90ce_return_output := result_sp_MUX_uxn_opcodes_h_l213_c2_90ce_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l235_c7_1aa7] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l235_c7_1aa7_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l235_c7_1aa7_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l235_c7_1aa7_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l235_c7_1aa7_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l235_c7_1aa7_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l235_c7_1aa7_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l235_c7_1aa7_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l235_c7_1aa7_return_output;

     -- result_stack_address_MUX[uxn_opcodes_h_l254_c7_7d9e] LATENCY=0
     -- Inputs
     result_stack_address_MUX_uxn_opcodes_h_l254_c7_7d9e_cond <= VAR_result_stack_address_MUX_uxn_opcodes_h_l254_c7_7d9e_cond;
     result_stack_address_MUX_uxn_opcodes_h_l254_c7_7d9e_iftrue <= VAR_result_stack_address_MUX_uxn_opcodes_h_l254_c7_7d9e_iftrue;
     result_stack_address_MUX_uxn_opcodes_h_l254_c7_7d9e_iffalse <= VAR_result_stack_address_MUX_uxn_opcodes_h_l254_c7_7d9e_iffalse;
     -- Outputs
     VAR_result_stack_address_MUX_uxn_opcodes_h_l254_c7_7d9e_return_output := result_stack_address_MUX_uxn_opcodes_h_l254_c7_7d9e_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l245_c7_89f9] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l245_c7_89f9_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l245_c7_89f9_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l245_c7_89f9_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l245_c7_89f9_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l245_c7_89f9_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l245_c7_89f9_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l245_c7_89f9_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l245_c7_89f9_return_output;

     -- Submodule level 2
     VAR_lit2_tmp16_MUX_uxn_opcodes_h_l240_c7_f4b1_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l241_c3_1959_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l254_c7_7d9e_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l258_c24_e54e_return_output;
     VAR_lit2_tmp16_MUX_uxn_opcodes_h_l228_c7_24e0_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l230_c3_766c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l245_c7_89f9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_7d9e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l240_c7_f4b1_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l245_c7_89f9_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l240_c7_f4b1_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l245_c7_89f9_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l228_c7_24e0_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l235_c7_1aa7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l245_c7_89f9_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_7d9e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l245_c7_89f9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_7d9e_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l235_c7_1aa7_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l240_c7_f4b1_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l240_c7_f4b1_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l245_c7_89f9_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l245_c7_89f9_iffalse := VAR_result_stack_address_MUX_uxn_opcodes_h_l254_c7_7d9e_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l254_c7_7d9e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l254_c7_7d9e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l254_c7_7d9e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l254_c7_7d9e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l254_c7_7d9e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l254_c7_7d9e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l254_c7_7d9e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l254_c7_7d9e_return_output := result_stack_value_MUX_uxn_opcodes_h_l254_c7_7d9e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l245_c7_89f9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l245_c7_89f9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l245_c7_89f9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l245_c7_89f9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l245_c7_89f9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l245_c7_89f9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l245_c7_89f9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l245_c7_89f9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l245_c7_89f9_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l240_c7_f4b1] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l240_c7_f4b1_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l240_c7_f4b1_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l240_c7_f4b1_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l240_c7_f4b1_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l240_c7_f4b1_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l240_c7_f4b1_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l240_c7_f4b1_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l240_c7_f4b1_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l228_c7_24e0] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l228_c7_24e0_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l228_c7_24e0_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l228_c7_24e0_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l228_c7_24e0_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l228_c7_24e0_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l228_c7_24e0_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l228_c7_24e0_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l228_c7_24e0_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l240_c7_f4b1] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l240_c7_f4b1_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l240_c7_f4b1_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l240_c7_f4b1_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l240_c7_f4b1_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l240_c7_f4b1_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l240_c7_f4b1_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l240_c7_f4b1_return_output := result_ram_addr_MUX_uxn_opcodes_h_l240_c7_f4b1_return_output;

     -- lit2_tmp16_MUX[uxn_opcodes_h_l240_c7_f4b1] LATENCY=0
     -- Inputs
     lit2_tmp16_MUX_uxn_opcodes_h_l240_c7_f4b1_cond <= VAR_lit2_tmp16_MUX_uxn_opcodes_h_l240_c7_f4b1_cond;
     lit2_tmp16_MUX_uxn_opcodes_h_l240_c7_f4b1_iftrue <= VAR_lit2_tmp16_MUX_uxn_opcodes_h_l240_c7_f4b1_iftrue;
     lit2_tmp16_MUX_uxn_opcodes_h_l240_c7_f4b1_iffalse <= VAR_lit2_tmp16_MUX_uxn_opcodes_h_l240_c7_f4b1_iffalse;
     -- Outputs
     VAR_lit2_tmp16_MUX_uxn_opcodes_h_l240_c7_f4b1_return_output := lit2_tmp16_MUX_uxn_opcodes_h_l240_c7_f4b1_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l235_c7_1aa7] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l235_c7_1aa7_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l235_c7_1aa7_cond;
     result_pc_MUX_uxn_opcodes_h_l235_c7_1aa7_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l235_c7_1aa7_iftrue;
     result_pc_MUX_uxn_opcodes_h_l235_c7_1aa7_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l235_c7_1aa7_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l235_c7_1aa7_return_output := result_pc_MUX_uxn_opcodes_h_l235_c7_1aa7_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l245_c7_89f9] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l245_c7_89f9_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l245_c7_89f9_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l245_c7_89f9_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l245_c7_89f9_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l245_c7_89f9_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l245_c7_89f9_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l245_c7_89f9_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l245_c7_89f9_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l240_c7_f4b1] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l240_c7_f4b1_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l240_c7_f4b1_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l240_c7_f4b1_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l240_c7_f4b1_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l240_c7_f4b1_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l240_c7_f4b1_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l240_c7_f4b1_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l240_c7_f4b1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l245_c7_89f9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l245_c7_89f9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l245_c7_89f9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l245_c7_89f9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l245_c7_89f9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l245_c7_89f9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l245_c7_89f9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l245_c7_89f9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l245_c7_89f9_return_output;

     -- result_stack_address_MUX[uxn_opcodes_h_l245_c7_89f9] LATENCY=0
     -- Inputs
     result_stack_address_MUX_uxn_opcodes_h_l245_c7_89f9_cond <= VAR_result_stack_address_MUX_uxn_opcodes_h_l245_c7_89f9_cond;
     result_stack_address_MUX_uxn_opcodes_h_l245_c7_89f9_iftrue <= VAR_result_stack_address_MUX_uxn_opcodes_h_l245_c7_89f9_iftrue;
     result_stack_address_MUX_uxn_opcodes_h_l245_c7_89f9_iffalse <= VAR_result_stack_address_MUX_uxn_opcodes_h_l245_c7_89f9_iffalse;
     -- Outputs
     VAR_result_stack_address_MUX_uxn_opcodes_h_l245_c7_89f9_return_output := result_stack_address_MUX_uxn_opcodes_h_l245_c7_89f9_return_output;

     -- Submodule level 3
     VAR_lit2_tmp16_MUX_uxn_opcodes_h_l235_c7_1aa7_iffalse := VAR_lit2_tmp16_MUX_uxn_opcodes_h_l240_c7_f4b1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l240_c7_f4b1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l245_c7_89f9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l235_c7_1aa7_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l240_c7_f4b1_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l235_c7_1aa7_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l240_c7_f4b1_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l223_c7_079f_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l228_c7_24e0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l240_c7_f4b1_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l245_c7_89f9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l240_c7_f4b1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l245_c7_89f9_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l228_c7_24e0_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l235_c7_1aa7_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l235_c7_1aa7_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l240_c7_f4b1_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l240_c7_f4b1_iffalse := VAR_result_stack_address_MUX_uxn_opcodes_h_l245_c7_89f9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l245_c7_89f9_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l254_c7_7d9e_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l228_c7_24e0] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l228_c7_24e0_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l228_c7_24e0_cond;
     result_pc_MUX_uxn_opcodes_h_l228_c7_24e0_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l228_c7_24e0_iftrue;
     result_pc_MUX_uxn_opcodes_h_l228_c7_24e0_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l228_c7_24e0_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l228_c7_24e0_return_output := result_pc_MUX_uxn_opcodes_h_l228_c7_24e0_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l235_c7_1aa7] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l235_c7_1aa7_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l235_c7_1aa7_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l235_c7_1aa7_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l235_c7_1aa7_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l235_c7_1aa7_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l235_c7_1aa7_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l235_c7_1aa7_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l235_c7_1aa7_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l223_c7_079f] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l223_c7_079f_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l223_c7_079f_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l223_c7_079f_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l223_c7_079f_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l223_c7_079f_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l223_c7_079f_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l223_c7_079f_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l223_c7_079f_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l240_c7_f4b1] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l240_c7_f4b1_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l240_c7_f4b1_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l240_c7_f4b1_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l240_c7_f4b1_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l240_c7_f4b1_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l240_c7_f4b1_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l240_c7_f4b1_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l240_c7_f4b1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l240_c7_f4b1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l240_c7_f4b1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l240_c7_f4b1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l240_c7_f4b1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l240_c7_f4b1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l240_c7_f4b1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l240_c7_f4b1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l240_c7_f4b1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l240_c7_f4b1_return_output;

     -- lit2_tmp16_MUX[uxn_opcodes_h_l235_c7_1aa7] LATENCY=0
     -- Inputs
     lit2_tmp16_MUX_uxn_opcodes_h_l235_c7_1aa7_cond <= VAR_lit2_tmp16_MUX_uxn_opcodes_h_l235_c7_1aa7_cond;
     lit2_tmp16_MUX_uxn_opcodes_h_l235_c7_1aa7_iftrue <= VAR_lit2_tmp16_MUX_uxn_opcodes_h_l235_c7_1aa7_iftrue;
     lit2_tmp16_MUX_uxn_opcodes_h_l235_c7_1aa7_iffalse <= VAR_lit2_tmp16_MUX_uxn_opcodes_h_l235_c7_1aa7_iffalse;
     -- Outputs
     VAR_lit2_tmp16_MUX_uxn_opcodes_h_l235_c7_1aa7_return_output := lit2_tmp16_MUX_uxn_opcodes_h_l235_c7_1aa7_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l235_c7_1aa7] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l235_c7_1aa7_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l235_c7_1aa7_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l235_c7_1aa7_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l235_c7_1aa7_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l235_c7_1aa7_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l235_c7_1aa7_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l235_c7_1aa7_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l235_c7_1aa7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l240_c7_f4b1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l240_c7_f4b1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l240_c7_f4b1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l240_c7_f4b1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l240_c7_f4b1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l240_c7_f4b1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l240_c7_f4b1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l240_c7_f4b1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l240_c7_f4b1_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l235_c7_1aa7] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l235_c7_1aa7_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l235_c7_1aa7_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l235_c7_1aa7_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l235_c7_1aa7_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l235_c7_1aa7_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l235_c7_1aa7_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l235_c7_1aa7_return_output := result_ram_addr_MUX_uxn_opcodes_h_l235_c7_1aa7_return_output;

     -- result_stack_address_MUX[uxn_opcodes_h_l240_c7_f4b1] LATENCY=0
     -- Inputs
     result_stack_address_MUX_uxn_opcodes_h_l240_c7_f4b1_cond <= VAR_result_stack_address_MUX_uxn_opcodes_h_l240_c7_f4b1_cond;
     result_stack_address_MUX_uxn_opcodes_h_l240_c7_f4b1_iftrue <= VAR_result_stack_address_MUX_uxn_opcodes_h_l240_c7_f4b1_iftrue;
     result_stack_address_MUX_uxn_opcodes_h_l240_c7_f4b1_iffalse <= VAR_result_stack_address_MUX_uxn_opcodes_h_l240_c7_f4b1_iffalse;
     -- Outputs
     VAR_result_stack_address_MUX_uxn_opcodes_h_l240_c7_f4b1_return_output := result_stack_address_MUX_uxn_opcodes_h_l240_c7_f4b1_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l245_c7_89f9] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l245_c7_89f9_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l245_c7_89f9_cond;
     result_stack_value_MUX_uxn_opcodes_h_l245_c7_89f9_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l245_c7_89f9_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l245_c7_89f9_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l245_c7_89f9_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l245_c7_89f9_return_output := result_stack_value_MUX_uxn_opcodes_h_l245_c7_89f9_return_output;

     -- Submodule level 4
     VAR_lit2_tmp16_MUX_uxn_opcodes_h_l228_c7_24e0_iffalse := VAR_lit2_tmp16_MUX_uxn_opcodes_h_l235_c7_1aa7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l235_c7_1aa7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l240_c7_f4b1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l228_c7_24e0_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l235_c7_1aa7_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l228_c7_24e0_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l235_c7_1aa7_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l218_c7_2f08_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l223_c7_079f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l235_c7_1aa7_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l240_c7_f4b1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l235_c7_1aa7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l240_c7_f4b1_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l223_c7_079f_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l228_c7_24e0_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l228_c7_24e0_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l235_c7_1aa7_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l235_c7_1aa7_iffalse := VAR_result_stack_address_MUX_uxn_opcodes_h_l240_c7_f4b1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l240_c7_f4b1_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l245_c7_89f9_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l228_c7_24e0] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l228_c7_24e0_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l228_c7_24e0_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l228_c7_24e0_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l228_c7_24e0_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l228_c7_24e0_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l228_c7_24e0_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l228_c7_24e0_return_output := result_ram_addr_MUX_uxn_opcodes_h_l228_c7_24e0_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l228_c7_24e0] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l228_c7_24e0_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l228_c7_24e0_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l228_c7_24e0_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l228_c7_24e0_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l228_c7_24e0_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l228_c7_24e0_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l228_c7_24e0_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l228_c7_24e0_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l235_c7_1aa7] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l235_c7_1aa7_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l235_c7_1aa7_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l235_c7_1aa7_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l235_c7_1aa7_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l235_c7_1aa7_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l235_c7_1aa7_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l235_c7_1aa7_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l235_c7_1aa7_return_output;

     -- lit2_tmp16_MUX[uxn_opcodes_h_l228_c7_24e0] LATENCY=0
     -- Inputs
     lit2_tmp16_MUX_uxn_opcodes_h_l228_c7_24e0_cond <= VAR_lit2_tmp16_MUX_uxn_opcodes_h_l228_c7_24e0_cond;
     lit2_tmp16_MUX_uxn_opcodes_h_l228_c7_24e0_iftrue <= VAR_lit2_tmp16_MUX_uxn_opcodes_h_l228_c7_24e0_iftrue;
     lit2_tmp16_MUX_uxn_opcodes_h_l228_c7_24e0_iffalse <= VAR_lit2_tmp16_MUX_uxn_opcodes_h_l228_c7_24e0_iffalse;
     -- Outputs
     VAR_lit2_tmp16_MUX_uxn_opcodes_h_l228_c7_24e0_return_output := lit2_tmp16_MUX_uxn_opcodes_h_l228_c7_24e0_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l228_c7_24e0] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l228_c7_24e0_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l228_c7_24e0_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l228_c7_24e0_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l228_c7_24e0_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l228_c7_24e0_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l228_c7_24e0_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l228_c7_24e0_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l228_c7_24e0_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l223_c7_079f] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l223_c7_079f_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l223_c7_079f_cond;
     result_pc_MUX_uxn_opcodes_h_l223_c7_079f_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l223_c7_079f_iftrue;
     result_pc_MUX_uxn_opcodes_h_l223_c7_079f_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l223_c7_079f_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l223_c7_079f_return_output := result_pc_MUX_uxn_opcodes_h_l223_c7_079f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l240_c7_f4b1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l240_c7_f4b1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l240_c7_f4b1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l240_c7_f4b1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l240_c7_f4b1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l240_c7_f4b1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l240_c7_f4b1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l240_c7_f4b1_return_output := result_stack_value_MUX_uxn_opcodes_h_l240_c7_f4b1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l235_c7_1aa7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l235_c7_1aa7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l235_c7_1aa7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l235_c7_1aa7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l235_c7_1aa7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l235_c7_1aa7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l235_c7_1aa7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l235_c7_1aa7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l235_c7_1aa7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l235_c7_1aa7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l235_c7_1aa7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l235_c7_1aa7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l235_c7_1aa7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l235_c7_1aa7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l235_c7_1aa7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l235_c7_1aa7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l235_c7_1aa7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l235_c7_1aa7_return_output;

     -- result_stack_address_MUX[uxn_opcodes_h_l235_c7_1aa7] LATENCY=0
     -- Inputs
     result_stack_address_MUX_uxn_opcodes_h_l235_c7_1aa7_cond <= VAR_result_stack_address_MUX_uxn_opcodes_h_l235_c7_1aa7_cond;
     result_stack_address_MUX_uxn_opcodes_h_l235_c7_1aa7_iftrue <= VAR_result_stack_address_MUX_uxn_opcodes_h_l235_c7_1aa7_iftrue;
     result_stack_address_MUX_uxn_opcodes_h_l235_c7_1aa7_iffalse <= VAR_result_stack_address_MUX_uxn_opcodes_h_l235_c7_1aa7_iffalse;
     -- Outputs
     VAR_result_stack_address_MUX_uxn_opcodes_h_l235_c7_1aa7_return_output := result_stack_address_MUX_uxn_opcodes_h_l235_c7_1aa7_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l218_c7_2f08] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l218_c7_2f08_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l218_c7_2f08_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l218_c7_2f08_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l218_c7_2f08_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l218_c7_2f08_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l218_c7_2f08_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l218_c7_2f08_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l218_c7_2f08_return_output;

     -- Submodule level 5
     VAR_lit2_tmp16_MUX_uxn_opcodes_h_l223_c7_079f_iffalse := VAR_lit2_tmp16_MUX_uxn_opcodes_h_l228_c7_24e0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l228_c7_24e0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l235_c7_1aa7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l223_c7_079f_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l228_c7_24e0_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l223_c7_079f_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l228_c7_24e0_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l213_c2_90ce_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l218_c7_2f08_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l228_c7_24e0_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l235_c7_1aa7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l228_c7_24e0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l235_c7_1aa7_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l218_c7_2f08_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l223_c7_079f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l223_c7_079f_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l228_c7_24e0_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l228_c7_24e0_iffalse := VAR_result_stack_address_MUX_uxn_opcodes_h_l235_c7_1aa7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l235_c7_1aa7_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l240_c7_f4b1_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l228_c7_24e0] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l228_c7_24e0_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l228_c7_24e0_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l228_c7_24e0_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l228_c7_24e0_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l228_c7_24e0_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l228_c7_24e0_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l228_c7_24e0_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l228_c7_24e0_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l223_c7_079f] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l223_c7_079f_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l223_c7_079f_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l223_c7_079f_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l223_c7_079f_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l223_c7_079f_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l223_c7_079f_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l223_c7_079f_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l223_c7_079f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l235_c7_1aa7] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l235_c7_1aa7_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l235_c7_1aa7_cond;
     result_stack_value_MUX_uxn_opcodes_h_l235_c7_1aa7_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l235_c7_1aa7_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l235_c7_1aa7_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l235_c7_1aa7_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l235_c7_1aa7_return_output := result_stack_value_MUX_uxn_opcodes_h_l235_c7_1aa7_return_output;

     -- result_stack_address_MUX[uxn_opcodes_h_l228_c7_24e0] LATENCY=0
     -- Inputs
     result_stack_address_MUX_uxn_opcodes_h_l228_c7_24e0_cond <= VAR_result_stack_address_MUX_uxn_opcodes_h_l228_c7_24e0_cond;
     result_stack_address_MUX_uxn_opcodes_h_l228_c7_24e0_iftrue <= VAR_result_stack_address_MUX_uxn_opcodes_h_l228_c7_24e0_iftrue;
     result_stack_address_MUX_uxn_opcodes_h_l228_c7_24e0_iffalse <= VAR_result_stack_address_MUX_uxn_opcodes_h_l228_c7_24e0_iffalse;
     -- Outputs
     VAR_result_stack_address_MUX_uxn_opcodes_h_l228_c7_24e0_return_output := result_stack_address_MUX_uxn_opcodes_h_l228_c7_24e0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l228_c7_24e0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l228_c7_24e0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l228_c7_24e0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l228_c7_24e0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l228_c7_24e0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l228_c7_24e0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l228_c7_24e0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l228_c7_24e0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l228_c7_24e0_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l223_c7_079f] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l223_c7_079f_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l223_c7_079f_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l223_c7_079f_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l223_c7_079f_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l223_c7_079f_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l223_c7_079f_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l223_c7_079f_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l223_c7_079f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l228_c7_24e0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l228_c7_24e0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l228_c7_24e0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l228_c7_24e0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l228_c7_24e0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l228_c7_24e0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l228_c7_24e0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l228_c7_24e0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l228_c7_24e0_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l213_c2_90ce] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l213_c2_90ce_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l213_c2_90ce_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l213_c2_90ce_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l213_c2_90ce_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l213_c2_90ce_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l213_c2_90ce_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l213_c2_90ce_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l213_c2_90ce_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l223_c7_079f] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l223_c7_079f_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l223_c7_079f_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l223_c7_079f_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l223_c7_079f_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l223_c7_079f_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l223_c7_079f_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l223_c7_079f_return_output := result_ram_addr_MUX_uxn_opcodes_h_l223_c7_079f_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l218_c7_2f08] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l218_c7_2f08_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l218_c7_2f08_cond;
     result_pc_MUX_uxn_opcodes_h_l218_c7_2f08_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l218_c7_2f08_iftrue;
     result_pc_MUX_uxn_opcodes_h_l218_c7_2f08_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l218_c7_2f08_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l218_c7_2f08_return_output := result_pc_MUX_uxn_opcodes_h_l218_c7_2f08_return_output;

     -- lit2_tmp16_MUX[uxn_opcodes_h_l223_c7_079f] LATENCY=0
     -- Inputs
     lit2_tmp16_MUX_uxn_opcodes_h_l223_c7_079f_cond <= VAR_lit2_tmp16_MUX_uxn_opcodes_h_l223_c7_079f_cond;
     lit2_tmp16_MUX_uxn_opcodes_h_l223_c7_079f_iftrue <= VAR_lit2_tmp16_MUX_uxn_opcodes_h_l223_c7_079f_iftrue;
     lit2_tmp16_MUX_uxn_opcodes_h_l223_c7_079f_iffalse <= VAR_lit2_tmp16_MUX_uxn_opcodes_h_l223_c7_079f_iffalse;
     -- Outputs
     VAR_lit2_tmp16_MUX_uxn_opcodes_h_l223_c7_079f_return_output := lit2_tmp16_MUX_uxn_opcodes_h_l223_c7_079f_return_output;

     -- Submodule level 6
     VAR_lit2_tmp16_MUX_uxn_opcodes_h_l218_c7_2f08_iffalse := VAR_lit2_tmp16_MUX_uxn_opcodes_h_l223_c7_079f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l223_c7_079f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l228_c7_24e0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l218_c7_2f08_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l223_c7_079f_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l218_c7_2f08_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l223_c7_079f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l223_c7_079f_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l228_c7_24e0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l223_c7_079f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l228_c7_24e0_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l213_c2_90ce_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l218_c7_2f08_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l218_c7_2f08_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l223_c7_079f_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l223_c7_079f_iffalse := VAR_result_stack_address_MUX_uxn_opcodes_h_l228_c7_24e0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l228_c7_24e0_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l235_c7_1aa7_return_output;
     -- result_stack_address_MUX[uxn_opcodes_h_l223_c7_079f] LATENCY=0
     -- Inputs
     result_stack_address_MUX_uxn_opcodes_h_l223_c7_079f_cond <= VAR_result_stack_address_MUX_uxn_opcodes_h_l223_c7_079f_cond;
     result_stack_address_MUX_uxn_opcodes_h_l223_c7_079f_iftrue <= VAR_result_stack_address_MUX_uxn_opcodes_h_l223_c7_079f_iftrue;
     result_stack_address_MUX_uxn_opcodes_h_l223_c7_079f_iffalse <= VAR_result_stack_address_MUX_uxn_opcodes_h_l223_c7_079f_iffalse;
     -- Outputs
     VAR_result_stack_address_MUX_uxn_opcodes_h_l223_c7_079f_return_output := result_stack_address_MUX_uxn_opcodes_h_l223_c7_079f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l223_c7_079f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l223_c7_079f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l223_c7_079f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l223_c7_079f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l223_c7_079f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l223_c7_079f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l223_c7_079f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l223_c7_079f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l223_c7_079f_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l213_c2_90ce] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l213_c2_90ce_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l213_c2_90ce_cond;
     result_pc_MUX_uxn_opcodes_h_l213_c2_90ce_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l213_c2_90ce_iftrue;
     result_pc_MUX_uxn_opcodes_h_l213_c2_90ce_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l213_c2_90ce_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l213_c2_90ce_return_output := result_pc_MUX_uxn_opcodes_h_l213_c2_90ce_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l223_c7_079f] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l223_c7_079f_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l223_c7_079f_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l223_c7_079f_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l223_c7_079f_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l223_c7_079f_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l223_c7_079f_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l223_c7_079f_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l223_c7_079f_return_output;

     -- lit2_tmp16_MUX[uxn_opcodes_h_l218_c7_2f08] LATENCY=0
     -- Inputs
     lit2_tmp16_MUX_uxn_opcodes_h_l218_c7_2f08_cond <= VAR_lit2_tmp16_MUX_uxn_opcodes_h_l218_c7_2f08_cond;
     lit2_tmp16_MUX_uxn_opcodes_h_l218_c7_2f08_iftrue <= VAR_lit2_tmp16_MUX_uxn_opcodes_h_l218_c7_2f08_iftrue;
     lit2_tmp16_MUX_uxn_opcodes_h_l218_c7_2f08_iffalse <= VAR_lit2_tmp16_MUX_uxn_opcodes_h_l218_c7_2f08_iffalse;
     -- Outputs
     VAR_lit2_tmp16_MUX_uxn_opcodes_h_l218_c7_2f08_return_output := lit2_tmp16_MUX_uxn_opcodes_h_l218_c7_2f08_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l223_c7_079f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l223_c7_079f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l223_c7_079f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l223_c7_079f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l223_c7_079f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l223_c7_079f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l223_c7_079f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l223_c7_079f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l223_c7_079f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l228_c7_24e0] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l228_c7_24e0_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l228_c7_24e0_cond;
     result_stack_value_MUX_uxn_opcodes_h_l228_c7_24e0_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l228_c7_24e0_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l228_c7_24e0_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l228_c7_24e0_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l228_c7_24e0_return_output := result_stack_value_MUX_uxn_opcodes_h_l228_c7_24e0_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l218_c7_2f08] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l218_c7_2f08_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l218_c7_2f08_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l218_c7_2f08_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l218_c7_2f08_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l218_c7_2f08_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l218_c7_2f08_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l218_c7_2f08_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l218_c7_2f08_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l218_c7_2f08] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l218_c7_2f08_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l218_c7_2f08_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l218_c7_2f08_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l218_c7_2f08_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l218_c7_2f08_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l218_c7_2f08_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l218_c7_2f08_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l218_c7_2f08_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l218_c7_2f08] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l218_c7_2f08_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l218_c7_2f08_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l218_c7_2f08_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l218_c7_2f08_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l218_c7_2f08_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l218_c7_2f08_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l218_c7_2f08_return_output := result_ram_addr_MUX_uxn_opcodes_h_l218_c7_2f08_return_output;

     -- Submodule level 7
     VAR_lit2_tmp16_MUX_uxn_opcodes_h_l213_c2_90ce_iffalse := VAR_lit2_tmp16_MUX_uxn_opcodes_h_l218_c7_2f08_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l218_c7_2f08_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l223_c7_079f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l213_c2_90ce_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l218_c7_2f08_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l213_c2_90ce_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l218_c7_2f08_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l218_c7_2f08_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l223_c7_079f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l218_c7_2f08_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l223_c7_079f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l213_c2_90ce_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l218_c7_2f08_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l218_c7_2f08_iffalse := VAR_result_stack_address_MUX_uxn_opcodes_h_l223_c7_079f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l223_c7_079f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l228_c7_24e0_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l218_c7_2f08] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l218_c7_2f08_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l218_c7_2f08_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l218_c7_2f08_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l218_c7_2f08_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l218_c7_2f08_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l218_c7_2f08_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l218_c7_2f08_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l218_c7_2f08_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l213_c2_90ce] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l213_c2_90ce_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l213_c2_90ce_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l213_c2_90ce_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l213_c2_90ce_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l213_c2_90ce_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l213_c2_90ce_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l213_c2_90ce_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l213_c2_90ce_return_output;

     -- result_stack_address_MUX[uxn_opcodes_h_l218_c7_2f08] LATENCY=0
     -- Inputs
     result_stack_address_MUX_uxn_opcodes_h_l218_c7_2f08_cond <= VAR_result_stack_address_MUX_uxn_opcodes_h_l218_c7_2f08_cond;
     result_stack_address_MUX_uxn_opcodes_h_l218_c7_2f08_iftrue <= VAR_result_stack_address_MUX_uxn_opcodes_h_l218_c7_2f08_iftrue;
     result_stack_address_MUX_uxn_opcodes_h_l218_c7_2f08_iffalse <= VAR_result_stack_address_MUX_uxn_opcodes_h_l218_c7_2f08_iffalse;
     -- Outputs
     VAR_result_stack_address_MUX_uxn_opcodes_h_l218_c7_2f08_return_output := result_stack_address_MUX_uxn_opcodes_h_l218_c7_2f08_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l218_c7_2f08] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l218_c7_2f08_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l218_c7_2f08_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l218_c7_2f08_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l218_c7_2f08_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l218_c7_2f08_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l218_c7_2f08_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l218_c7_2f08_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l218_c7_2f08_return_output;

     -- lit2_tmp16_MUX[uxn_opcodes_h_l213_c2_90ce] LATENCY=0
     -- Inputs
     lit2_tmp16_MUX_uxn_opcodes_h_l213_c2_90ce_cond <= VAR_lit2_tmp16_MUX_uxn_opcodes_h_l213_c2_90ce_cond;
     lit2_tmp16_MUX_uxn_opcodes_h_l213_c2_90ce_iftrue <= VAR_lit2_tmp16_MUX_uxn_opcodes_h_l213_c2_90ce_iftrue;
     lit2_tmp16_MUX_uxn_opcodes_h_l213_c2_90ce_iffalse <= VAR_lit2_tmp16_MUX_uxn_opcodes_h_l213_c2_90ce_iffalse;
     -- Outputs
     VAR_lit2_tmp16_MUX_uxn_opcodes_h_l213_c2_90ce_return_output := lit2_tmp16_MUX_uxn_opcodes_h_l213_c2_90ce_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l213_c2_90ce] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l213_c2_90ce_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l213_c2_90ce_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l213_c2_90ce_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l213_c2_90ce_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l213_c2_90ce_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l213_c2_90ce_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l213_c2_90ce_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l213_c2_90ce_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l213_c2_90ce] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l213_c2_90ce_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l213_c2_90ce_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l213_c2_90ce_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l213_c2_90ce_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l213_c2_90ce_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l213_c2_90ce_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l213_c2_90ce_return_output := result_ram_addr_MUX_uxn_opcodes_h_l213_c2_90ce_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l218_c7_2f08] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l218_c7_2f08_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l218_c7_2f08_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l218_c7_2f08_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l218_c7_2f08_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l218_c7_2f08_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l218_c7_2f08_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l218_c7_2f08_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l218_c7_2f08_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l223_c7_079f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l223_c7_079f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l223_c7_079f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l223_c7_079f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l223_c7_079f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l223_c7_079f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l223_c7_079f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l223_c7_079f_return_output := result_stack_value_MUX_uxn_opcodes_h_l223_c7_079f_return_output;

     -- Submodule level 8
     REG_VAR_lit2_tmp16 := VAR_lit2_tmp16_MUX_uxn_opcodes_h_l213_c2_90ce_return_output;
     VAR_printf_uxn_opcodes_h_l266_c2_1672_uxn_opcodes_h_l266_c2_1672_arg4 := resize(VAR_lit2_tmp16_MUX_uxn_opcodes_h_l213_c2_90ce_return_output, 32);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l213_c2_90ce_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l218_c7_2f08_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l213_c2_90ce_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l218_c7_2f08_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l213_c2_90ce_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l218_c7_2f08_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l213_c2_90ce_iffalse := VAR_result_stack_address_MUX_uxn_opcodes_h_l218_c7_2f08_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l218_c7_2f08_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l223_c7_079f_return_output;
     -- printf_uxn_opcodes_h_l266_c2_1672[uxn_opcodes_h_l266_c2_1672] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l266_c2_1672_uxn_opcodes_h_l266_c2_1672_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l266_c2_1672_uxn_opcodes_h_l266_c2_1672_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l266_c2_1672_uxn_opcodes_h_l266_c2_1672_arg0 <= VAR_printf_uxn_opcodes_h_l266_c2_1672_uxn_opcodes_h_l266_c2_1672_arg0;
     printf_uxn_opcodes_h_l266_c2_1672_uxn_opcodes_h_l266_c2_1672_arg1 <= VAR_printf_uxn_opcodes_h_l266_c2_1672_uxn_opcodes_h_l266_c2_1672_arg1;
     printf_uxn_opcodes_h_l266_c2_1672_uxn_opcodes_h_l266_c2_1672_arg2 <= VAR_printf_uxn_opcodes_h_l266_c2_1672_uxn_opcodes_h_l266_c2_1672_arg2;
     printf_uxn_opcodes_h_l266_c2_1672_uxn_opcodes_h_l266_c2_1672_arg3 <= VAR_printf_uxn_opcodes_h_l266_c2_1672_uxn_opcodes_h_l266_c2_1672_arg3;
     printf_uxn_opcodes_h_l266_c2_1672_uxn_opcodes_h_l266_c2_1672_arg4 <= VAR_printf_uxn_opcodes_h_l266_c2_1672_uxn_opcodes_h_l266_c2_1672_arg4;
     -- Outputs

     -- result_stack_address_MUX[uxn_opcodes_h_l213_c2_90ce] LATENCY=0
     -- Inputs
     result_stack_address_MUX_uxn_opcodes_h_l213_c2_90ce_cond <= VAR_result_stack_address_MUX_uxn_opcodes_h_l213_c2_90ce_cond;
     result_stack_address_MUX_uxn_opcodes_h_l213_c2_90ce_iftrue <= VAR_result_stack_address_MUX_uxn_opcodes_h_l213_c2_90ce_iftrue;
     result_stack_address_MUX_uxn_opcodes_h_l213_c2_90ce_iffalse <= VAR_result_stack_address_MUX_uxn_opcodes_h_l213_c2_90ce_iffalse;
     -- Outputs
     VAR_result_stack_address_MUX_uxn_opcodes_h_l213_c2_90ce_return_output := result_stack_address_MUX_uxn_opcodes_h_l213_c2_90ce_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l218_c7_2f08] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l218_c7_2f08_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l218_c7_2f08_cond;
     result_stack_value_MUX_uxn_opcodes_h_l218_c7_2f08_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l218_c7_2f08_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l218_c7_2f08_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l218_c7_2f08_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l218_c7_2f08_return_output := result_stack_value_MUX_uxn_opcodes_h_l218_c7_2f08_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l213_c2_90ce] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l213_c2_90ce_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l213_c2_90ce_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l213_c2_90ce_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l213_c2_90ce_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l213_c2_90ce_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l213_c2_90ce_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l213_c2_90ce_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l213_c2_90ce_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l213_c2_90ce] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l213_c2_90ce_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l213_c2_90ce_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l213_c2_90ce_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l213_c2_90ce_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l213_c2_90ce_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l213_c2_90ce_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l213_c2_90ce_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l213_c2_90ce_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l213_c2_90ce] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l213_c2_90ce_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l213_c2_90ce_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l213_c2_90ce_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l213_c2_90ce_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l213_c2_90ce_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l213_c2_90ce_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l213_c2_90ce_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l213_c2_90ce_return_output;

     -- Submodule level 9
     VAR_result_stack_value_MUX_uxn_opcodes_h_l213_c2_90ce_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l218_c7_2f08_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l213_c2_90ce] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l213_c2_90ce_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l213_c2_90ce_cond;
     result_stack_value_MUX_uxn_opcodes_h_l213_c2_90ce_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l213_c2_90ce_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l213_c2_90ce_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l213_c2_90ce_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l213_c2_90ce_return_output := result_stack_value_MUX_uxn_opcodes_h_l213_c2_90ce_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_4937_uxn_opcodes_h_l268_l208_DUPLICATE_7ddb LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4937_uxn_opcodes_h_l268_l208_DUPLICATE_7ddb_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_4937(
     result,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l213_c2_90ce_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l213_c2_90ce_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l213_c2_90ce_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l213_c2_90ce_return_output,
     VAR_result_pc_MUX_uxn_opcodes_h_l213_c2_90ce_return_output,
     VAR_result_sp_MUX_uxn_opcodes_h_l213_c2_90ce_return_output,
     VAR_result_stack_address_MUX_uxn_opcodes_h_l213_c2_90ce_return_output,
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l213_c2_90ce_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l213_c2_90ce_return_output,
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l213_c2_90ce_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l213_c2_90ce_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l213_c2_90ce_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4937_uxn_opcodes_h_l268_l208_DUPLICATE_7ddb_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4937_uxn_opcodes_h_l268_l208_DUPLICATE_7ddb_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_lit2_tmp16 <= REG_VAR_lit2_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     lit2_tmp16 <= REG_COMB_lit2_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
