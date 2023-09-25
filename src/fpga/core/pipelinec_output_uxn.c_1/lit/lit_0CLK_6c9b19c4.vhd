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
-- Submodules: 73
entity lit_0CLK_6c9b19c4 is
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
end lit_0CLK_6c9b19c4;
architecture arch of lit_0CLK_6c9b19c4 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal lit_tmp8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_lit_tmp8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l166_c6_bc3e]
signal BIN_OP_EQ_uxn_opcodes_h_l166_c6_bc3e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l166_c6_bc3e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l166_c6_bc3e_return_output : unsigned(0 downto 0);

-- lit_tmp8_MUX[uxn_opcodes_h_l166_c2_a0c1]
signal lit_tmp8_MUX_uxn_opcodes_h_l166_c2_a0c1_cond : unsigned(0 downto 0);
signal lit_tmp8_MUX_uxn_opcodes_h_l166_c2_a0c1_iftrue : unsigned(7 downto 0);
signal lit_tmp8_MUX_uxn_opcodes_h_l166_c2_a0c1_iffalse : unsigned(7 downto 0);
signal lit_tmp8_MUX_uxn_opcodes_h_l166_c2_a0c1_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l166_c2_a0c1]
signal result_stack_value_MUX_uxn_opcodes_h_l166_c2_a0c1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l166_c2_a0c1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l166_c2_a0c1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l166_c2_a0c1_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l166_c2_a0c1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l166_c2_a0c1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l166_c2_a0c1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l166_c2_a0c1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l166_c2_a0c1_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l166_c2_a0c1]
signal result_is_stack_read_MUX_uxn_opcodes_h_l166_c2_a0c1_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l166_c2_a0c1_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l166_c2_a0c1_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l166_c2_a0c1_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l166_c2_a0c1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l166_c2_a0c1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l166_c2_a0c1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l166_c2_a0c1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l166_c2_a0c1_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l166_c2_a0c1]
signal result_pc_MUX_uxn_opcodes_h_l166_c2_a0c1_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l166_c2_a0c1_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l166_c2_a0c1_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l166_c2_a0c1_return_output : unsigned(15 downto 0);

-- result_sp_MUX[uxn_opcodes_h_l166_c2_a0c1]
signal result_sp_MUX_uxn_opcodes_h_l166_c2_a0c1_cond : unsigned(0 downto 0);
signal result_sp_MUX_uxn_opcodes_h_l166_c2_a0c1_iftrue : unsigned(7 downto 0);
signal result_sp_MUX_uxn_opcodes_h_l166_c2_a0c1_iffalse : unsigned(7 downto 0);
signal result_sp_MUX_uxn_opcodes_h_l166_c2_a0c1_return_output : unsigned(7 downto 0);

-- result_stack_address_MUX[uxn_opcodes_h_l166_c2_a0c1]
signal result_stack_address_MUX_uxn_opcodes_h_l166_c2_a0c1_cond : unsigned(0 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l166_c2_a0c1_iftrue : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l166_c2_a0c1_iffalse : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l166_c2_a0c1_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l166_c2_a0c1]
signal result_is_ram_read_MUX_uxn_opcodes_h_l166_c2_a0c1_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l166_c2_a0c1_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l166_c2_a0c1_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l166_c2_a0c1_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l166_c2_a0c1]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l166_c2_a0c1_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l166_c2_a0c1_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l166_c2_a0c1_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l166_c2_a0c1_return_output : unsigned(0 downto 0);

-- result_is_sp_updated_MUX[uxn_opcodes_h_l166_c2_a0c1]
signal result_is_sp_updated_MUX_uxn_opcodes_h_l166_c2_a0c1_cond : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l166_c2_a0c1_iftrue : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l166_c2_a0c1_iffalse : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l166_c2_a0c1_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l166_c2_a0c1]
signal result_ram_addr_MUX_uxn_opcodes_h_l166_c2_a0c1_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l166_c2_a0c1_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l166_c2_a0c1_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l166_c2_a0c1_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l166_c2_a0c1]
signal result_is_ram_write_MUX_uxn_opcodes_h_l166_c2_a0c1_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l166_c2_a0c1_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l166_c2_a0c1_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l166_c2_a0c1_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l168_c15_dcac]
signal BIN_OP_PLUS_uxn_opcodes_h_l168_c15_dcac_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l168_c15_dcac_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l168_c15_dcac_return_output : unsigned(8 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l171_c11_f085]
signal BIN_OP_EQ_uxn_opcodes_h_l171_c11_f085_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l171_c11_f085_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l171_c11_f085_return_output : unsigned(0 downto 0);

-- lit_tmp8_MUX[uxn_opcodes_h_l171_c7_bfd4]
signal lit_tmp8_MUX_uxn_opcodes_h_l171_c7_bfd4_cond : unsigned(0 downto 0);
signal lit_tmp8_MUX_uxn_opcodes_h_l171_c7_bfd4_iftrue : unsigned(7 downto 0);
signal lit_tmp8_MUX_uxn_opcodes_h_l171_c7_bfd4_iffalse : unsigned(7 downto 0);
signal lit_tmp8_MUX_uxn_opcodes_h_l171_c7_bfd4_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l171_c7_bfd4]
signal result_stack_value_MUX_uxn_opcodes_h_l171_c7_bfd4_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l171_c7_bfd4_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l171_c7_bfd4_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l171_c7_bfd4_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l171_c7_bfd4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_bfd4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_bfd4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_bfd4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_bfd4_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l171_c7_bfd4]
signal result_is_stack_read_MUX_uxn_opcodes_h_l171_c7_bfd4_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l171_c7_bfd4_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l171_c7_bfd4_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l171_c7_bfd4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l171_c7_bfd4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_bfd4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_bfd4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_bfd4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_bfd4_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l171_c7_bfd4]
signal result_pc_MUX_uxn_opcodes_h_l171_c7_bfd4_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l171_c7_bfd4_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l171_c7_bfd4_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l171_c7_bfd4_return_output : unsigned(15 downto 0);

-- result_stack_address_MUX[uxn_opcodes_h_l171_c7_bfd4]
signal result_stack_address_MUX_uxn_opcodes_h_l171_c7_bfd4_cond : unsigned(0 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l171_c7_bfd4_iftrue : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l171_c7_bfd4_iffalse : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l171_c7_bfd4_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l171_c7_bfd4]
signal result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_bfd4_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_bfd4_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_bfd4_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_bfd4_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l171_c7_bfd4]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_bfd4_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_bfd4_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_bfd4_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_bfd4_return_output : unsigned(0 downto 0);

-- result_is_sp_updated_MUX[uxn_opcodes_h_l171_c7_bfd4]
signal result_is_sp_updated_MUX_uxn_opcodes_h_l171_c7_bfd4_cond : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l171_c7_bfd4_iftrue : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l171_c7_bfd4_iffalse : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l171_c7_bfd4_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l171_c7_bfd4]
signal result_ram_addr_MUX_uxn_opcodes_h_l171_c7_bfd4_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l171_c7_bfd4_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l171_c7_bfd4_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l171_c7_bfd4_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l171_c7_bfd4]
signal result_is_ram_write_MUX_uxn_opcodes_h_l171_c7_bfd4_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l171_c7_bfd4_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l171_c7_bfd4_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l171_c7_bfd4_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l177_c11_59aa]
signal BIN_OP_EQ_uxn_opcodes_h_l177_c11_59aa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l177_c11_59aa_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l177_c11_59aa_return_output : unsigned(0 downto 0);

-- lit_tmp8_MUX[uxn_opcodes_h_l177_c7_8c4a]
signal lit_tmp8_MUX_uxn_opcodes_h_l177_c7_8c4a_cond : unsigned(0 downto 0);
signal lit_tmp8_MUX_uxn_opcodes_h_l177_c7_8c4a_iftrue : unsigned(7 downto 0);
signal lit_tmp8_MUX_uxn_opcodes_h_l177_c7_8c4a_iffalse : unsigned(7 downto 0);
signal lit_tmp8_MUX_uxn_opcodes_h_l177_c7_8c4a_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l177_c7_8c4a]
signal result_stack_value_MUX_uxn_opcodes_h_l177_c7_8c4a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l177_c7_8c4a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l177_c7_8c4a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l177_c7_8c4a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l177_c7_8c4a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_8c4a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_8c4a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_8c4a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_8c4a_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l177_c7_8c4a]
signal result_is_stack_read_MUX_uxn_opcodes_h_l177_c7_8c4a_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l177_c7_8c4a_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l177_c7_8c4a_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l177_c7_8c4a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l177_c7_8c4a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l177_c7_8c4a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l177_c7_8c4a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l177_c7_8c4a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l177_c7_8c4a_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l177_c7_8c4a]
signal result_pc_MUX_uxn_opcodes_h_l177_c7_8c4a_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l177_c7_8c4a_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l177_c7_8c4a_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l177_c7_8c4a_return_output : unsigned(15 downto 0);

-- result_stack_address_MUX[uxn_opcodes_h_l177_c7_8c4a]
signal result_stack_address_MUX_uxn_opcodes_h_l177_c7_8c4a_cond : unsigned(0 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l177_c7_8c4a_iftrue : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l177_c7_8c4a_iffalse : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l177_c7_8c4a_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l177_c7_8c4a]
signal result_is_ram_read_MUX_uxn_opcodes_h_l177_c7_8c4a_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l177_c7_8c4a_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l177_c7_8c4a_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l177_c7_8c4a_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l177_c7_8c4a]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_8c4a_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_8c4a_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_8c4a_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_8c4a_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l177_c7_8c4a]
signal result_ram_addr_MUX_uxn_opcodes_h_l177_c7_8c4a_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l177_c7_8c4a_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l177_c7_8c4a_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l177_c7_8c4a_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l177_c7_8c4a]
signal result_is_ram_write_MUX_uxn_opcodes_h_l177_c7_8c4a_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l177_c7_8c4a_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l177_c7_8c4a_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l177_c7_8c4a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l182_c11_5180]
signal BIN_OP_EQ_uxn_opcodes_h_l182_c11_5180_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l182_c11_5180_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l182_c11_5180_return_output : unsigned(0 downto 0);

-- lit_tmp8_MUX[uxn_opcodes_h_l182_c7_1326]
signal lit_tmp8_MUX_uxn_opcodes_h_l182_c7_1326_cond : unsigned(0 downto 0);
signal lit_tmp8_MUX_uxn_opcodes_h_l182_c7_1326_iftrue : unsigned(7 downto 0);
signal lit_tmp8_MUX_uxn_opcodes_h_l182_c7_1326_iffalse : unsigned(7 downto 0);
signal lit_tmp8_MUX_uxn_opcodes_h_l182_c7_1326_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l182_c7_1326]
signal result_stack_value_MUX_uxn_opcodes_h_l182_c7_1326_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l182_c7_1326_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l182_c7_1326_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l182_c7_1326_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l182_c7_1326]
signal result_is_opc_done_MUX_uxn_opcodes_h_l182_c7_1326_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l182_c7_1326_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l182_c7_1326_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l182_c7_1326_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l182_c7_1326]
signal result_is_stack_read_MUX_uxn_opcodes_h_l182_c7_1326_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l182_c7_1326_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l182_c7_1326_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l182_c7_1326_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l182_c7_1326]
signal result_is_stack_write_MUX_uxn_opcodes_h_l182_c7_1326_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l182_c7_1326_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l182_c7_1326_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l182_c7_1326_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l182_c7_1326]
signal result_pc_MUX_uxn_opcodes_h_l182_c7_1326_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l182_c7_1326_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l182_c7_1326_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l182_c7_1326_return_output : unsigned(15 downto 0);

-- result_stack_address_MUX[uxn_opcodes_h_l182_c7_1326]
signal result_stack_address_MUX_uxn_opcodes_h_l182_c7_1326_cond : unsigned(0 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l182_c7_1326_iftrue : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l182_c7_1326_iffalse : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l182_c7_1326_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l182_c7_1326]
signal result_is_ram_read_MUX_uxn_opcodes_h_l182_c7_1326_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l182_c7_1326_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l182_c7_1326_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l182_c7_1326_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l182_c7_1326]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l182_c7_1326_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l182_c7_1326_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l182_c7_1326_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l182_c7_1326_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l182_c7_1326]
signal result_ram_addr_MUX_uxn_opcodes_h_l182_c7_1326_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l182_c7_1326_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l182_c7_1326_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l182_c7_1326_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l184_c15_19e8]
signal BIN_OP_PLUS_uxn_opcodes_h_l184_c15_19e8_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l184_c15_19e8_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l184_c15_19e8_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l187_c11_cb32]
signal BIN_OP_EQ_uxn_opcodes_h_l187_c11_cb32_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l187_c11_cb32_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l187_c11_cb32_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l187_c7_91b3]
signal result_stack_value_MUX_uxn_opcodes_h_l187_c7_91b3_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l187_c7_91b3_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l187_c7_91b3_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l187_c7_91b3_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l187_c7_91b3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_91b3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_91b3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_91b3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_91b3_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l187_c7_91b3]
signal result_is_stack_read_MUX_uxn_opcodes_h_l187_c7_91b3_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l187_c7_91b3_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l187_c7_91b3_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l187_c7_91b3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l187_c7_91b3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l187_c7_91b3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l187_c7_91b3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l187_c7_91b3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l187_c7_91b3_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l187_c7_91b3]
signal result_pc_MUX_uxn_opcodes_h_l187_c7_91b3_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l187_c7_91b3_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l187_c7_91b3_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l187_c7_91b3_return_output : unsigned(15 downto 0);

-- result_stack_address_MUX[uxn_opcodes_h_l187_c7_91b3]
signal result_stack_address_MUX_uxn_opcodes_h_l187_c7_91b3_cond : unsigned(0 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l187_c7_91b3_iftrue : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l187_c7_91b3_iffalse : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l187_c7_91b3_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l187_c7_91b3]
signal result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_91b3_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_91b3_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_91b3_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_91b3_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l187_c7_91b3]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_91b3_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_91b3_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_91b3_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_91b3_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l187_c7_91b3]
signal result_ram_addr_MUX_uxn_opcodes_h_l187_c7_91b3_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l187_c7_91b3_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l187_c7_91b3_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l187_c7_91b3_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l190_c26_ac53]
signal BIN_OP_MINUS_uxn_opcodes_h_l190_c26_ac53_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l190_c26_ac53_right : unsigned(0 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l190_c26_ac53_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l193_c11_b478]
signal BIN_OP_EQ_uxn_opcodes_h_l193_c11_b478_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l193_c11_b478_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l193_c11_b478_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l193_c7_bdd8]
signal result_stack_value_MUX_uxn_opcodes_h_l193_c7_bdd8_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l193_c7_bdd8_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l193_c7_bdd8_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l193_c7_bdd8_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l193_c7_bdd8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_bdd8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_bdd8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_bdd8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_bdd8_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l193_c7_bdd8]
signal result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_bdd8_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_bdd8_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_bdd8_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_bdd8_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l193_c7_bdd8]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_bdd8_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_bdd8_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_bdd8_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_bdd8_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l193_c7_bdd8]
signal result_ram_addr_MUX_uxn_opcodes_h_l193_c7_bdd8_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l193_c7_bdd8_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l193_c7_bdd8_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l193_c7_bdd8_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l193_c7_bdd8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_bdd8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_bdd8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_bdd8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_bdd8_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l193_c7_bdd8]
signal result_pc_MUX_uxn_opcodes_h_l193_c7_bdd8_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l193_c7_bdd8_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l193_c7_bdd8_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l193_c7_bdd8_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l203_c2_0e5f[uxn_opcodes_h_l203_c2_0e5f]
signal printf_uxn_opcodes_h_l203_c2_0e5f_uxn_opcodes_h_l203_c2_0e5f_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l203_c2_0e5f_uxn_opcodes_h_l203_c2_0e5f_arg0 : unsigned(31 downto 0);
signal printf_uxn_opcodes_h_l203_c2_0e5f_uxn_opcodes_h_l203_c2_0e5f_arg1 : unsigned(31 downto 0);
signal printf_uxn_opcodes_h_l203_c2_0e5f_uxn_opcodes_h_l203_c2_0e5f_arg2 : unsigned(31 downto 0);
signal printf_uxn_opcodes_h_l203_c2_0e5f_uxn_opcodes_h_l203_c2_0e5f_arg3 : unsigned(31 downto 0);
signal printf_uxn_opcodes_h_l203_c2_0e5f_uxn_opcodes_h_l203_c2_0e5f_arg4 : unsigned(31 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l166_c6_bc3e
BIN_OP_EQ_uxn_opcodes_h_l166_c6_bc3e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l166_c6_bc3e_left,
BIN_OP_EQ_uxn_opcodes_h_l166_c6_bc3e_right,
BIN_OP_EQ_uxn_opcodes_h_l166_c6_bc3e_return_output);

-- lit_tmp8_MUX_uxn_opcodes_h_l166_c2_a0c1
lit_tmp8_MUX_uxn_opcodes_h_l166_c2_a0c1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
lit_tmp8_MUX_uxn_opcodes_h_l166_c2_a0c1_cond,
lit_tmp8_MUX_uxn_opcodes_h_l166_c2_a0c1_iftrue,
lit_tmp8_MUX_uxn_opcodes_h_l166_c2_a0c1_iffalse,
lit_tmp8_MUX_uxn_opcodes_h_l166_c2_a0c1_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l166_c2_a0c1
result_stack_value_MUX_uxn_opcodes_h_l166_c2_a0c1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l166_c2_a0c1_cond,
result_stack_value_MUX_uxn_opcodes_h_l166_c2_a0c1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l166_c2_a0c1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l166_c2_a0c1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l166_c2_a0c1
result_is_opc_done_MUX_uxn_opcodes_h_l166_c2_a0c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l166_c2_a0c1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l166_c2_a0c1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l166_c2_a0c1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l166_c2_a0c1_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l166_c2_a0c1
result_is_stack_read_MUX_uxn_opcodes_h_l166_c2_a0c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l166_c2_a0c1_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l166_c2_a0c1_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l166_c2_a0c1_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l166_c2_a0c1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l166_c2_a0c1
result_is_stack_write_MUX_uxn_opcodes_h_l166_c2_a0c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l166_c2_a0c1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l166_c2_a0c1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l166_c2_a0c1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l166_c2_a0c1_return_output);

-- result_pc_MUX_uxn_opcodes_h_l166_c2_a0c1
result_pc_MUX_uxn_opcodes_h_l166_c2_a0c1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l166_c2_a0c1_cond,
result_pc_MUX_uxn_opcodes_h_l166_c2_a0c1_iftrue,
result_pc_MUX_uxn_opcodes_h_l166_c2_a0c1_iffalse,
result_pc_MUX_uxn_opcodes_h_l166_c2_a0c1_return_output);

-- result_sp_MUX_uxn_opcodes_h_l166_c2_a0c1
result_sp_MUX_uxn_opcodes_h_l166_c2_a0c1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_sp_MUX_uxn_opcodes_h_l166_c2_a0c1_cond,
result_sp_MUX_uxn_opcodes_h_l166_c2_a0c1_iftrue,
result_sp_MUX_uxn_opcodes_h_l166_c2_a0c1_iffalse,
result_sp_MUX_uxn_opcodes_h_l166_c2_a0c1_return_output);

-- result_stack_address_MUX_uxn_opcodes_h_l166_c2_a0c1
result_stack_address_MUX_uxn_opcodes_h_l166_c2_a0c1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_MUX_uxn_opcodes_h_l166_c2_a0c1_cond,
result_stack_address_MUX_uxn_opcodes_h_l166_c2_a0c1_iftrue,
result_stack_address_MUX_uxn_opcodes_h_l166_c2_a0c1_iffalse,
result_stack_address_MUX_uxn_opcodes_h_l166_c2_a0c1_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l166_c2_a0c1
result_is_ram_read_MUX_uxn_opcodes_h_l166_c2_a0c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l166_c2_a0c1_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l166_c2_a0c1_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l166_c2_a0c1_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l166_c2_a0c1_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l166_c2_a0c1
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c2_a0c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c2_a0c1_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c2_a0c1_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c2_a0c1_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c2_a0c1_return_output);

-- result_is_sp_updated_MUX_uxn_opcodes_h_l166_c2_a0c1
result_is_sp_updated_MUX_uxn_opcodes_h_l166_c2_a0c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_updated_MUX_uxn_opcodes_h_l166_c2_a0c1_cond,
result_is_sp_updated_MUX_uxn_opcodes_h_l166_c2_a0c1_iftrue,
result_is_sp_updated_MUX_uxn_opcodes_h_l166_c2_a0c1_iffalse,
result_is_sp_updated_MUX_uxn_opcodes_h_l166_c2_a0c1_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l166_c2_a0c1
result_ram_addr_MUX_uxn_opcodes_h_l166_c2_a0c1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l166_c2_a0c1_cond,
result_ram_addr_MUX_uxn_opcodes_h_l166_c2_a0c1_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l166_c2_a0c1_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l166_c2_a0c1_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l166_c2_a0c1
result_is_ram_write_MUX_uxn_opcodes_h_l166_c2_a0c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l166_c2_a0c1_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l166_c2_a0c1_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l166_c2_a0c1_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l166_c2_a0c1_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l168_c15_dcac
BIN_OP_PLUS_uxn_opcodes_h_l168_c15_dcac : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l168_c15_dcac_left,
BIN_OP_PLUS_uxn_opcodes_h_l168_c15_dcac_right,
BIN_OP_PLUS_uxn_opcodes_h_l168_c15_dcac_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l171_c11_f085
BIN_OP_EQ_uxn_opcodes_h_l171_c11_f085 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l171_c11_f085_left,
BIN_OP_EQ_uxn_opcodes_h_l171_c11_f085_right,
BIN_OP_EQ_uxn_opcodes_h_l171_c11_f085_return_output);

-- lit_tmp8_MUX_uxn_opcodes_h_l171_c7_bfd4
lit_tmp8_MUX_uxn_opcodes_h_l171_c7_bfd4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
lit_tmp8_MUX_uxn_opcodes_h_l171_c7_bfd4_cond,
lit_tmp8_MUX_uxn_opcodes_h_l171_c7_bfd4_iftrue,
lit_tmp8_MUX_uxn_opcodes_h_l171_c7_bfd4_iffalse,
lit_tmp8_MUX_uxn_opcodes_h_l171_c7_bfd4_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l171_c7_bfd4
result_stack_value_MUX_uxn_opcodes_h_l171_c7_bfd4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l171_c7_bfd4_cond,
result_stack_value_MUX_uxn_opcodes_h_l171_c7_bfd4_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l171_c7_bfd4_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l171_c7_bfd4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_bfd4
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_bfd4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_bfd4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_bfd4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_bfd4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_bfd4_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l171_c7_bfd4
result_is_stack_read_MUX_uxn_opcodes_h_l171_c7_bfd4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l171_c7_bfd4_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l171_c7_bfd4_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l171_c7_bfd4_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l171_c7_bfd4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_bfd4
result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_bfd4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_bfd4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_bfd4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_bfd4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_bfd4_return_output);

-- result_pc_MUX_uxn_opcodes_h_l171_c7_bfd4
result_pc_MUX_uxn_opcodes_h_l171_c7_bfd4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l171_c7_bfd4_cond,
result_pc_MUX_uxn_opcodes_h_l171_c7_bfd4_iftrue,
result_pc_MUX_uxn_opcodes_h_l171_c7_bfd4_iffalse,
result_pc_MUX_uxn_opcodes_h_l171_c7_bfd4_return_output);

-- result_stack_address_MUX_uxn_opcodes_h_l171_c7_bfd4
result_stack_address_MUX_uxn_opcodes_h_l171_c7_bfd4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_MUX_uxn_opcodes_h_l171_c7_bfd4_cond,
result_stack_address_MUX_uxn_opcodes_h_l171_c7_bfd4_iftrue,
result_stack_address_MUX_uxn_opcodes_h_l171_c7_bfd4_iffalse,
result_stack_address_MUX_uxn_opcodes_h_l171_c7_bfd4_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_bfd4
result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_bfd4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_bfd4_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_bfd4_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_bfd4_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_bfd4_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_bfd4
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_bfd4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_bfd4_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_bfd4_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_bfd4_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_bfd4_return_output);

-- result_is_sp_updated_MUX_uxn_opcodes_h_l171_c7_bfd4
result_is_sp_updated_MUX_uxn_opcodes_h_l171_c7_bfd4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_updated_MUX_uxn_opcodes_h_l171_c7_bfd4_cond,
result_is_sp_updated_MUX_uxn_opcodes_h_l171_c7_bfd4_iftrue,
result_is_sp_updated_MUX_uxn_opcodes_h_l171_c7_bfd4_iffalse,
result_is_sp_updated_MUX_uxn_opcodes_h_l171_c7_bfd4_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l171_c7_bfd4
result_ram_addr_MUX_uxn_opcodes_h_l171_c7_bfd4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l171_c7_bfd4_cond,
result_ram_addr_MUX_uxn_opcodes_h_l171_c7_bfd4_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l171_c7_bfd4_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l171_c7_bfd4_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l171_c7_bfd4
result_is_ram_write_MUX_uxn_opcodes_h_l171_c7_bfd4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l171_c7_bfd4_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l171_c7_bfd4_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l171_c7_bfd4_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l171_c7_bfd4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l177_c11_59aa
BIN_OP_EQ_uxn_opcodes_h_l177_c11_59aa : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l177_c11_59aa_left,
BIN_OP_EQ_uxn_opcodes_h_l177_c11_59aa_right,
BIN_OP_EQ_uxn_opcodes_h_l177_c11_59aa_return_output);

-- lit_tmp8_MUX_uxn_opcodes_h_l177_c7_8c4a
lit_tmp8_MUX_uxn_opcodes_h_l177_c7_8c4a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
lit_tmp8_MUX_uxn_opcodes_h_l177_c7_8c4a_cond,
lit_tmp8_MUX_uxn_opcodes_h_l177_c7_8c4a_iftrue,
lit_tmp8_MUX_uxn_opcodes_h_l177_c7_8c4a_iffalse,
lit_tmp8_MUX_uxn_opcodes_h_l177_c7_8c4a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l177_c7_8c4a
result_stack_value_MUX_uxn_opcodes_h_l177_c7_8c4a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l177_c7_8c4a_cond,
result_stack_value_MUX_uxn_opcodes_h_l177_c7_8c4a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l177_c7_8c4a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l177_c7_8c4a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_8c4a
result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_8c4a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_8c4a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_8c4a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_8c4a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_8c4a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l177_c7_8c4a
result_is_stack_read_MUX_uxn_opcodes_h_l177_c7_8c4a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l177_c7_8c4a_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l177_c7_8c4a_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l177_c7_8c4a_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l177_c7_8c4a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l177_c7_8c4a
result_is_stack_write_MUX_uxn_opcodes_h_l177_c7_8c4a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l177_c7_8c4a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l177_c7_8c4a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l177_c7_8c4a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l177_c7_8c4a_return_output);

-- result_pc_MUX_uxn_opcodes_h_l177_c7_8c4a
result_pc_MUX_uxn_opcodes_h_l177_c7_8c4a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l177_c7_8c4a_cond,
result_pc_MUX_uxn_opcodes_h_l177_c7_8c4a_iftrue,
result_pc_MUX_uxn_opcodes_h_l177_c7_8c4a_iffalse,
result_pc_MUX_uxn_opcodes_h_l177_c7_8c4a_return_output);

-- result_stack_address_MUX_uxn_opcodes_h_l177_c7_8c4a
result_stack_address_MUX_uxn_opcodes_h_l177_c7_8c4a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_MUX_uxn_opcodes_h_l177_c7_8c4a_cond,
result_stack_address_MUX_uxn_opcodes_h_l177_c7_8c4a_iftrue,
result_stack_address_MUX_uxn_opcodes_h_l177_c7_8c4a_iffalse,
result_stack_address_MUX_uxn_opcodes_h_l177_c7_8c4a_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l177_c7_8c4a
result_is_ram_read_MUX_uxn_opcodes_h_l177_c7_8c4a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l177_c7_8c4a_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l177_c7_8c4a_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l177_c7_8c4a_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l177_c7_8c4a_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_8c4a
result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_8c4a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_8c4a_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_8c4a_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_8c4a_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_8c4a_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l177_c7_8c4a
result_ram_addr_MUX_uxn_opcodes_h_l177_c7_8c4a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l177_c7_8c4a_cond,
result_ram_addr_MUX_uxn_opcodes_h_l177_c7_8c4a_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l177_c7_8c4a_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l177_c7_8c4a_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l177_c7_8c4a
result_is_ram_write_MUX_uxn_opcodes_h_l177_c7_8c4a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l177_c7_8c4a_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l177_c7_8c4a_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l177_c7_8c4a_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l177_c7_8c4a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l182_c11_5180
BIN_OP_EQ_uxn_opcodes_h_l182_c11_5180 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l182_c11_5180_left,
BIN_OP_EQ_uxn_opcodes_h_l182_c11_5180_right,
BIN_OP_EQ_uxn_opcodes_h_l182_c11_5180_return_output);

-- lit_tmp8_MUX_uxn_opcodes_h_l182_c7_1326
lit_tmp8_MUX_uxn_opcodes_h_l182_c7_1326 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
lit_tmp8_MUX_uxn_opcodes_h_l182_c7_1326_cond,
lit_tmp8_MUX_uxn_opcodes_h_l182_c7_1326_iftrue,
lit_tmp8_MUX_uxn_opcodes_h_l182_c7_1326_iffalse,
lit_tmp8_MUX_uxn_opcodes_h_l182_c7_1326_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l182_c7_1326
result_stack_value_MUX_uxn_opcodes_h_l182_c7_1326 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l182_c7_1326_cond,
result_stack_value_MUX_uxn_opcodes_h_l182_c7_1326_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l182_c7_1326_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l182_c7_1326_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l182_c7_1326
result_is_opc_done_MUX_uxn_opcodes_h_l182_c7_1326 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l182_c7_1326_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l182_c7_1326_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l182_c7_1326_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l182_c7_1326_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l182_c7_1326
result_is_stack_read_MUX_uxn_opcodes_h_l182_c7_1326 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l182_c7_1326_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l182_c7_1326_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l182_c7_1326_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l182_c7_1326_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l182_c7_1326
result_is_stack_write_MUX_uxn_opcodes_h_l182_c7_1326 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l182_c7_1326_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l182_c7_1326_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l182_c7_1326_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l182_c7_1326_return_output);

-- result_pc_MUX_uxn_opcodes_h_l182_c7_1326
result_pc_MUX_uxn_opcodes_h_l182_c7_1326 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l182_c7_1326_cond,
result_pc_MUX_uxn_opcodes_h_l182_c7_1326_iftrue,
result_pc_MUX_uxn_opcodes_h_l182_c7_1326_iffalse,
result_pc_MUX_uxn_opcodes_h_l182_c7_1326_return_output);

-- result_stack_address_MUX_uxn_opcodes_h_l182_c7_1326
result_stack_address_MUX_uxn_opcodes_h_l182_c7_1326 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_MUX_uxn_opcodes_h_l182_c7_1326_cond,
result_stack_address_MUX_uxn_opcodes_h_l182_c7_1326_iftrue,
result_stack_address_MUX_uxn_opcodes_h_l182_c7_1326_iffalse,
result_stack_address_MUX_uxn_opcodes_h_l182_c7_1326_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l182_c7_1326
result_is_ram_read_MUX_uxn_opcodes_h_l182_c7_1326 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l182_c7_1326_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l182_c7_1326_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l182_c7_1326_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l182_c7_1326_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l182_c7_1326
result_is_pc_updated_MUX_uxn_opcodes_h_l182_c7_1326 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l182_c7_1326_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l182_c7_1326_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l182_c7_1326_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l182_c7_1326_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l182_c7_1326
result_ram_addr_MUX_uxn_opcodes_h_l182_c7_1326 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l182_c7_1326_cond,
result_ram_addr_MUX_uxn_opcodes_h_l182_c7_1326_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l182_c7_1326_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l182_c7_1326_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l184_c15_19e8
BIN_OP_PLUS_uxn_opcodes_h_l184_c15_19e8 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l184_c15_19e8_left,
BIN_OP_PLUS_uxn_opcodes_h_l184_c15_19e8_right,
BIN_OP_PLUS_uxn_opcodes_h_l184_c15_19e8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l187_c11_cb32
BIN_OP_EQ_uxn_opcodes_h_l187_c11_cb32 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l187_c11_cb32_left,
BIN_OP_EQ_uxn_opcodes_h_l187_c11_cb32_right,
BIN_OP_EQ_uxn_opcodes_h_l187_c11_cb32_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l187_c7_91b3
result_stack_value_MUX_uxn_opcodes_h_l187_c7_91b3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l187_c7_91b3_cond,
result_stack_value_MUX_uxn_opcodes_h_l187_c7_91b3_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l187_c7_91b3_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l187_c7_91b3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_91b3
result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_91b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_91b3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_91b3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_91b3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_91b3_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l187_c7_91b3
result_is_stack_read_MUX_uxn_opcodes_h_l187_c7_91b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l187_c7_91b3_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l187_c7_91b3_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l187_c7_91b3_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l187_c7_91b3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l187_c7_91b3
result_is_stack_write_MUX_uxn_opcodes_h_l187_c7_91b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l187_c7_91b3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l187_c7_91b3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l187_c7_91b3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l187_c7_91b3_return_output);

-- result_pc_MUX_uxn_opcodes_h_l187_c7_91b3
result_pc_MUX_uxn_opcodes_h_l187_c7_91b3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l187_c7_91b3_cond,
result_pc_MUX_uxn_opcodes_h_l187_c7_91b3_iftrue,
result_pc_MUX_uxn_opcodes_h_l187_c7_91b3_iffalse,
result_pc_MUX_uxn_opcodes_h_l187_c7_91b3_return_output);

-- result_stack_address_MUX_uxn_opcodes_h_l187_c7_91b3
result_stack_address_MUX_uxn_opcodes_h_l187_c7_91b3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_MUX_uxn_opcodes_h_l187_c7_91b3_cond,
result_stack_address_MUX_uxn_opcodes_h_l187_c7_91b3_iftrue,
result_stack_address_MUX_uxn_opcodes_h_l187_c7_91b3_iffalse,
result_stack_address_MUX_uxn_opcodes_h_l187_c7_91b3_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_91b3
result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_91b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_91b3_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_91b3_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_91b3_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_91b3_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_91b3
result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_91b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_91b3_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_91b3_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_91b3_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_91b3_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l187_c7_91b3
result_ram_addr_MUX_uxn_opcodes_h_l187_c7_91b3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l187_c7_91b3_cond,
result_ram_addr_MUX_uxn_opcodes_h_l187_c7_91b3_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l187_c7_91b3_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l187_c7_91b3_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l190_c26_ac53
BIN_OP_MINUS_uxn_opcodes_h_l190_c26_ac53 : entity work.BIN_OP_MINUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l190_c26_ac53_left,
BIN_OP_MINUS_uxn_opcodes_h_l190_c26_ac53_right,
BIN_OP_MINUS_uxn_opcodes_h_l190_c26_ac53_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l193_c11_b478
BIN_OP_EQ_uxn_opcodes_h_l193_c11_b478 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l193_c11_b478_left,
BIN_OP_EQ_uxn_opcodes_h_l193_c11_b478_right,
BIN_OP_EQ_uxn_opcodes_h_l193_c11_b478_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l193_c7_bdd8
result_stack_value_MUX_uxn_opcodes_h_l193_c7_bdd8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l193_c7_bdd8_cond,
result_stack_value_MUX_uxn_opcodes_h_l193_c7_bdd8_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l193_c7_bdd8_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l193_c7_bdd8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_bdd8
result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_bdd8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_bdd8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_bdd8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_bdd8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_bdd8_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_bdd8
result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_bdd8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_bdd8_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_bdd8_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_bdd8_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_bdd8_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_bdd8
result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_bdd8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_bdd8_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_bdd8_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_bdd8_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_bdd8_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l193_c7_bdd8
result_ram_addr_MUX_uxn_opcodes_h_l193_c7_bdd8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l193_c7_bdd8_cond,
result_ram_addr_MUX_uxn_opcodes_h_l193_c7_bdd8_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l193_c7_bdd8_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l193_c7_bdd8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_bdd8
result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_bdd8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_bdd8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_bdd8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_bdd8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_bdd8_return_output);

-- result_pc_MUX_uxn_opcodes_h_l193_c7_bdd8
result_pc_MUX_uxn_opcodes_h_l193_c7_bdd8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l193_c7_bdd8_cond,
result_pc_MUX_uxn_opcodes_h_l193_c7_bdd8_iftrue,
result_pc_MUX_uxn_opcodes_h_l193_c7_bdd8_iffalse,
result_pc_MUX_uxn_opcodes_h_l193_c7_bdd8_return_output);

-- printf_uxn_opcodes_h_l203_c2_0e5f_uxn_opcodes_h_l203_c2_0e5f
printf_uxn_opcodes_h_l203_c2_0e5f_uxn_opcodes_h_l203_c2_0e5f : entity work.printf_uxn_opcodes_h_l203_c2_0e5f_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l203_c2_0e5f_uxn_opcodes_h_l203_c2_0e5f_CLOCK_ENABLE,
printf_uxn_opcodes_h_l203_c2_0e5f_uxn_opcodes_h_l203_c2_0e5f_arg0,
printf_uxn_opcodes_h_l203_c2_0e5f_uxn_opcodes_h_l203_c2_0e5f_arg1,
printf_uxn_opcodes_h_l203_c2_0e5f_uxn_opcodes_h_l203_c2_0e5f_arg2,
printf_uxn_opcodes_h_l203_c2_0e5f_uxn_opcodes_h_l203_c2_0e5f_arg3,
printf_uxn_opcodes_h_l203_c2_0e5f_uxn_opcodes_h_l203_c2_0e5f_arg4);



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
 lit_tmp8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l166_c6_bc3e_return_output,
 lit_tmp8_MUX_uxn_opcodes_h_l166_c2_a0c1_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l166_c2_a0c1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l166_c2_a0c1_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l166_c2_a0c1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l166_c2_a0c1_return_output,
 result_pc_MUX_uxn_opcodes_h_l166_c2_a0c1_return_output,
 result_sp_MUX_uxn_opcodes_h_l166_c2_a0c1_return_output,
 result_stack_address_MUX_uxn_opcodes_h_l166_c2_a0c1_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l166_c2_a0c1_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l166_c2_a0c1_return_output,
 result_is_sp_updated_MUX_uxn_opcodes_h_l166_c2_a0c1_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l166_c2_a0c1_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l166_c2_a0c1_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l168_c15_dcac_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l171_c11_f085_return_output,
 lit_tmp8_MUX_uxn_opcodes_h_l171_c7_bfd4_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l171_c7_bfd4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_bfd4_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l171_c7_bfd4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_bfd4_return_output,
 result_pc_MUX_uxn_opcodes_h_l171_c7_bfd4_return_output,
 result_stack_address_MUX_uxn_opcodes_h_l171_c7_bfd4_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_bfd4_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_bfd4_return_output,
 result_is_sp_updated_MUX_uxn_opcodes_h_l171_c7_bfd4_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l171_c7_bfd4_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l171_c7_bfd4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l177_c11_59aa_return_output,
 lit_tmp8_MUX_uxn_opcodes_h_l177_c7_8c4a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l177_c7_8c4a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_8c4a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l177_c7_8c4a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l177_c7_8c4a_return_output,
 result_pc_MUX_uxn_opcodes_h_l177_c7_8c4a_return_output,
 result_stack_address_MUX_uxn_opcodes_h_l177_c7_8c4a_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l177_c7_8c4a_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_8c4a_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l177_c7_8c4a_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l177_c7_8c4a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l182_c11_5180_return_output,
 lit_tmp8_MUX_uxn_opcodes_h_l182_c7_1326_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l182_c7_1326_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l182_c7_1326_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l182_c7_1326_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l182_c7_1326_return_output,
 result_pc_MUX_uxn_opcodes_h_l182_c7_1326_return_output,
 result_stack_address_MUX_uxn_opcodes_h_l182_c7_1326_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l182_c7_1326_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l182_c7_1326_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l182_c7_1326_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l184_c15_19e8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l187_c11_cb32_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l187_c7_91b3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_91b3_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l187_c7_91b3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l187_c7_91b3_return_output,
 result_pc_MUX_uxn_opcodes_h_l187_c7_91b3_return_output,
 result_stack_address_MUX_uxn_opcodes_h_l187_c7_91b3_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_91b3_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_91b3_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l187_c7_91b3_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l190_c26_ac53_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l193_c11_b478_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l193_c7_bdd8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_bdd8_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_bdd8_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_bdd8_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l193_c7_bdd8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_bdd8_return_output,
 result_pc_MUX_uxn_opcodes_h_l193_c7_bdd8_return_output)
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
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c6_bc3e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c6_bc3e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c6_bc3e_return_output : unsigned(0 downto 0);
 variable VAR_lit_tmp8_MUX_uxn_opcodes_h_l166_c2_a0c1_iftrue : unsigned(7 downto 0);
 variable VAR_lit_tmp8_MUX_uxn_opcodes_h_l166_c2_a0c1_iffalse : unsigned(7 downto 0);
 variable VAR_lit_tmp8_MUX_uxn_opcodes_h_l171_c7_bfd4_return_output : unsigned(7 downto 0);
 variable VAR_lit_tmp8_MUX_uxn_opcodes_h_l166_c2_a0c1_return_output : unsigned(7 downto 0);
 variable VAR_lit_tmp8_MUX_uxn_opcodes_h_l166_c2_a0c1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l166_c2_a0c1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l166_c2_a0c1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l171_c7_bfd4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l166_c2_a0c1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l166_c2_a0c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c2_a0c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c2_a0c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_bfd4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c2_a0c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c2_a0c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l166_c2_a0c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l166_c2_a0c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l171_c7_bfd4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l166_c2_a0c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l166_c2_a0c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c2_a0c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c2_a0c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_bfd4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c2_a0c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c2_a0c1_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l166_c2_a0c1_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l166_c2_a0c1_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l171_c7_bfd4_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l166_c2_a0c1_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l166_c2_a0c1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l166_c2_a0c1_iftrue : unsigned(7 downto 0);
 variable VAR_result_sp_uxn_opcodes_h_l168_c3_a1fa : unsigned(7 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l166_c2_a0c1_iffalse : unsigned(7 downto 0);
 variable VAR_result_sp_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_sp_d41d_uxn_opcodes_h_l166_c2_a0c1_return_output : unsigned(7 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l166_c2_a0c1_return_output : unsigned(7 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l166_c2_a0c1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l166_c2_a0c1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l166_c2_a0c1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l171_c7_bfd4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l166_c2_a0c1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l166_c2_a0c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l166_c2_a0c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l166_c2_a0c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_bfd4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l166_c2_a0c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l166_c2_a0c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c2_a0c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c2_a0c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_bfd4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c2_a0c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c2_a0c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l166_c2_a0c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l166_c2_a0c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l171_c7_bfd4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l166_c2_a0c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l166_c2_a0c1_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l166_c2_a0c1_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l166_c2_a0c1_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l171_c7_bfd4_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l166_c2_a0c1_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l166_c2_a0c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l166_c2_a0c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l166_c2_a0c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l171_c7_bfd4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l166_c2_a0c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l166_c2_a0c1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l168_c15_dcac_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l168_c15_dcac_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l168_c15_dcac_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_f085_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_f085_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_f085_return_output : unsigned(0 downto 0);
 variable VAR_lit_tmp8_MUX_uxn_opcodes_h_l171_c7_bfd4_iftrue : unsigned(7 downto 0);
 variable VAR_lit_tmp8_MUX_uxn_opcodes_h_l171_c7_bfd4_iffalse : unsigned(7 downto 0);
 variable VAR_lit_tmp8_MUX_uxn_opcodes_h_l177_c7_8c4a_return_output : unsigned(7 downto 0);
 variable VAR_lit_tmp8_MUX_uxn_opcodes_h_l171_c7_bfd4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l171_c7_bfd4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l171_c7_bfd4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l177_c7_8c4a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l171_c7_bfd4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_bfd4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_bfd4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_8c4a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_bfd4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l171_c7_bfd4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l171_c7_bfd4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l177_c7_8c4a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l171_c7_bfd4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_bfd4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_bfd4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l177_c7_8c4a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_bfd4_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l171_c7_bfd4_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l171_c7_bfd4_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l177_c7_8c4a_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l171_c7_bfd4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l171_c7_bfd4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l171_c7_bfd4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l177_c7_8c4a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l171_c7_bfd4_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_bfd4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_bfd4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l177_c7_8c4a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_bfd4_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_bfd4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_bfd4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_8c4a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_bfd4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l171_c7_bfd4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l171_c7_bfd4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_updated_d41d_uxn_opcodes_h_l171_c7_bfd4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l171_c7_bfd4_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l171_c7_bfd4_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l171_c7_bfd4_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l177_c7_8c4a_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l171_c7_bfd4_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l171_c7_bfd4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l171_c7_bfd4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l177_c7_8c4a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l171_c7_bfd4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l177_c11_59aa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l177_c11_59aa_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l177_c11_59aa_return_output : unsigned(0 downto 0);
 variable VAR_lit_tmp8_MUX_uxn_opcodes_h_l177_c7_8c4a_iftrue : unsigned(7 downto 0);
 variable VAR_lit_tmp8_MUX_uxn_opcodes_h_l177_c7_8c4a_iffalse : unsigned(7 downto 0);
 variable VAR_lit_tmp8_MUX_uxn_opcodes_h_l182_c7_1326_return_output : unsigned(7 downto 0);
 variable VAR_lit_tmp8_MUX_uxn_opcodes_h_l177_c7_8c4a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l177_c7_8c4a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l177_c7_8c4a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l182_c7_1326_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l177_c7_8c4a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_8c4a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_8c4a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l182_c7_1326_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_8c4a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l177_c7_8c4a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l177_c7_8c4a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l182_c7_1326_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l177_c7_8c4a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l177_c7_8c4a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l177_c7_8c4a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l182_c7_1326_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l177_c7_8c4a_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l177_c7_8c4a_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l177_c7_8c4a_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l182_c7_1326_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l177_c7_8c4a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l177_c7_8c4a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l177_c7_8c4a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l182_c7_1326_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l177_c7_8c4a_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l177_c7_8c4a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l177_c7_8c4a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l182_c7_1326_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l177_c7_8c4a_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_8c4a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_8c4a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l182_c7_1326_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_8c4a_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l177_c7_8c4a_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l177_c7_8c4a_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l182_c7_1326_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l177_c7_8c4a_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l177_c7_8c4a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l177_c7_8c4a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l177_c7_8c4a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l182_c11_5180_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l182_c11_5180_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l182_c11_5180_return_output : unsigned(0 downto 0);
 variable VAR_lit_tmp8_MUX_uxn_opcodes_h_l182_c7_1326_iftrue : unsigned(7 downto 0);
 variable VAR_lit_tmp8_MUX_uxn_opcodes_h_l182_c7_1326_iffalse : unsigned(7 downto 0);
 variable VAR_lit_tmp8_MUX_uxn_opcodes_h_l182_c7_1326_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l182_c7_1326_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l182_c7_1326_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l187_c7_91b3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l182_c7_1326_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l182_c7_1326_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l182_c7_1326_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_91b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l182_c7_1326_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l182_c7_1326_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l182_c7_1326_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l187_c7_91b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l182_c7_1326_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l182_c7_1326_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l182_c7_1326_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l187_c7_91b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l182_c7_1326_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l182_c7_1326_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_uxn_opcodes_h_l184_c3_f0b8 : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l182_c7_1326_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l187_c7_91b3_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l182_c7_1326_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l182_c7_1326_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l182_c7_1326_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l187_c7_91b3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l182_c7_1326_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l182_c7_1326_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l182_c7_1326_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_91b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l182_c7_1326_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l182_c7_1326_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l182_c7_1326_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_91b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l182_c7_1326_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l182_c7_1326_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l182_c7_1326_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l187_c7_91b3_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l182_c7_1326_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l184_c15_19e8_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l184_c15_19e8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l184_c15_19e8_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l187_c11_cb32_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l187_c11_cb32_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l187_c11_cb32_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l187_c7_91b3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l187_c7_91b3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l193_c7_bdd8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l187_c7_91b3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_91b3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_91b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_bdd8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_91b3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l187_c7_91b3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l187_c7_91b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l187_c7_91b3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l187_c7_91b3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l187_c7_91b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_bdd8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l187_c7_91b3_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l187_c7_91b3_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l187_c7_91b3_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l193_c7_bdd8_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l187_c7_91b3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l187_c7_91b3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l187_c7_91b3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l187_c7_91b3_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_91b3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_91b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_bdd8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_91b3_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_91b3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_91b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_bdd8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_91b3_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l187_c7_91b3_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l187_c7_91b3_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l193_c7_bdd8_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l187_c7_91b3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l190_c26_ac53_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l190_c26_ac53_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l190_c26_ac53_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l193_c11_b478_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l193_c11_b478_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l193_c11_b478_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l193_c7_bdd8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_uxn_opcodes_h_l198_c3_bb6e : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l193_c7_bdd8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l193_c7_bdd8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_bdd8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_bdd8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_bdd8_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_bdd8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_bdd8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_bdd8_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_bdd8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_bdd8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_bdd8_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l193_c7_bdd8_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l196_c3_a145 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l193_c7_bdd8_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l193_c7_bdd8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_bdd8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_bdd8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_bdd8_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l193_c7_bdd8_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_uxn_opcodes_h_l199_c3_aef0 : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l193_c7_bdd8_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l193_c7_bdd8_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l203_c2_0e5f_uxn_opcodes_h_l203_c2_0e5f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l203_c2_0e5f_uxn_opcodes_h_l203_c2_0e5f_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_opcodes_h_l203_c2_0e5f_uxn_opcodes_h_l203_c2_0e5f_arg1 : unsigned(31 downto 0);
 variable VAR_printf_uxn_opcodes_h_l203_c2_0e5f_uxn_opcodes_h_l203_c2_0e5f_arg2 : unsigned(31 downto 0);
 variable VAR_printf_uxn_opcodes_h_l203_c2_0e5f_uxn_opcodes_h_l203_c2_0e5f_arg3 : unsigned(31 downto 0);
 variable VAR_printf_uxn_opcodes_h_l203_c2_0e5f_uxn_opcodes_h_l203_c2_0e5f_arg4 : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l193_l182_l177_l171_l166_DUPLICATE_97d5_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l187_l182_l177_l171_l166_DUPLICATE_309d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l193_l182_l177_l171_l166_DUPLICATE_22df_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l193_l187_l177_l171_l166_DUPLICATE_c225_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_d41d_uxn_opcodes_h_l187_l182_l177_l171_l166_DUPLICATE_fd62_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l193_l166_l182_l187_DUPLICATE_a117_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l193_l187_l177_l171_l166_DUPLICATE_ffe0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l193_l166_l182_l187_DUPLICATE_9dfb_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l177_l166_DUPLICATE_89bf_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l193_l187_l182_l177_l171_DUPLICATE_964d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4937_uxn_opcodes_h_l205_l161_DUPLICATE_83ec_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_lit_tmp8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_lit_tmp8 := lit_tmp8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_pc_uxn_opcodes_h_l199_c3_aef0 := resize(to_unsigned(0, 1), 16);
     VAR_result_pc_MUX_uxn_opcodes_h_l193_c7_bdd8_iftrue := VAR_result_pc_uxn_opcodes_h_l199_c3_aef0;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l184_c15_19e8_right := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_bdd8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c6_bc3e_right := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l168_c15_dcac_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c2_a0c1_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l171_c7_bfd4_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l171_c7_bfd4_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l177_c11_59aa_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l193_c11_b478_right := to_unsigned(5, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l187_c7_91b3_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_bdd8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l187_c11_cb32_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_f085_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l187_c7_91b3_iftrue := to_unsigned(1, 1);
     VAR_result_ram_addr_uxn_opcodes_h_l196_c3_a145 := resize(to_unsigned(0, 1), 16);
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l193_c7_bdd8_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l196_c3_a145;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_bfd4_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l182_c7_1326_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l182_c11_5180_right := to_unsigned(3, 2);
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l166_c2_a0c1_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l177_c7_8c4a_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_bdd8_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l190_c26_ac53_right := to_unsigned(1, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_bdd8_iftrue := to_unsigned(0, 1);
     VAR_result_stack_value_uxn_opcodes_h_l198_c3_bb6e := resize(to_unsigned(0, 1), 8);
     VAR_result_stack_value_MUX_uxn_opcodes_h_l193_c7_bdd8_iftrue := VAR_result_stack_value_uxn_opcodes_h_l198_c3_bb6e;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l177_c7_8c4a_iftrue := to_unsigned(1, 1);

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
     VAR_printf_uxn_opcodes_h_l203_c2_0e5f_uxn_opcodes_h_l203_c2_0e5f_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_lit_tmp8_MUX_uxn_opcodes_h_l166_c2_a0c1_iftrue := lit_tmp8;
     VAR_lit_tmp8_MUX_uxn_opcodes_h_l171_c7_bfd4_iftrue := lit_tmp8;
     VAR_lit_tmp8_MUX_uxn_opcodes_h_l177_c7_8c4a_iftrue := lit_tmp8;
     VAR_lit_tmp8_MUX_uxn_opcodes_h_l182_c7_1326_iffalse := lit_tmp8;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l187_c7_91b3_iftrue := lit_tmp8;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l184_c15_19e8_left := VAR_pc;
     VAR_printf_uxn_opcodes_h_l203_c2_0e5f_uxn_opcodes_h_l203_c2_0e5f_arg2 := resize(VAR_pc, 32);
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l171_c7_bfd4_iftrue := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l177_c7_8c4a_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c6_bc3e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_f085_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l177_c11_59aa_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l182_c11_5180_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l187_c11_cb32_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l193_c11_b478_left := VAR_phase;
     VAR_printf_uxn_opcodes_h_l203_c2_0e5f_uxn_opcodes_h_l203_c2_0e5f_arg0 := resize(VAR_phase, 32);
     VAR_lit_tmp8_MUX_uxn_opcodes_h_l182_c7_1326_iftrue := VAR_previous_ram_read;
     VAR_printf_uxn_opcodes_h_l203_c2_0e5f_uxn_opcodes_h_l203_c2_0e5f_arg3 := resize(VAR_previous_ram_read, 32);
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l190_c26_ac53_left := VAR_sp;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l168_c15_dcac_left := VAR_sp;
     VAR_printf_uxn_opcodes_h_l203_c2_0e5f_uxn_opcodes_h_l203_c2_0e5f_arg1 := resize(VAR_sp, 32);
     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l193_l187_l177_l171_l166_DUPLICATE_c225 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l193_l187_l177_l171_l166_DUPLICATE_c225_return_output := result.pc;

     -- result_sp_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_sp_d41d[uxn_opcodes_h_l166_c2_a0c1] LATENCY=0
     VAR_result_sp_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_sp_d41d_uxn_opcodes_h_l166_c2_a0c1_return_output := result.sp;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l193_l166_l182_l187_DUPLICATE_a117 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l193_l166_l182_l187_DUPLICATE_a117_return_output := result.is_ram_read;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l193_l187_l177_l171_l166_DUPLICATE_ffe0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l193_l187_l177_l171_l166_DUPLICATE_ffe0_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l177_c11_59aa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l177_c11_59aa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l177_c11_59aa_left;
     BIN_OP_EQ_uxn_opcodes_h_l177_c11_59aa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l177_c11_59aa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l177_c11_59aa_return_output := BIN_OP_EQ_uxn_opcodes_h_l177_c11_59aa_return_output;

     -- BIN_OP_MINUS[uxn_opcodes_h_l190_c26_ac53] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l190_c26_ac53_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l190_c26_ac53_left;
     BIN_OP_MINUS_uxn_opcodes_h_l190_c26_ac53_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l190_c26_ac53_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l190_c26_ac53_return_output := BIN_OP_MINUS_uxn_opcodes_h_l190_c26_ac53_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l168_c15_dcac] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l168_c15_dcac_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l168_c15_dcac_left;
     BIN_OP_PLUS_uxn_opcodes_h_l168_c15_dcac_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l168_c15_dcac_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l168_c15_dcac_return_output := BIN_OP_PLUS_uxn_opcodes_h_l168_c15_dcac_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l193_l182_l177_l171_l166_DUPLICATE_22df LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l193_l182_l177_l171_l166_DUPLICATE_22df_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l171_c11_f085] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l171_c11_f085_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_f085_left;
     BIN_OP_EQ_uxn_opcodes_h_l171_c11_f085_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_f085_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_f085_return_output := BIN_OP_EQ_uxn_opcodes_h_l171_c11_f085_return_output;

     -- result_is_sp_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_updated_d41d[uxn_opcodes_h_l171_c7_bfd4] LATENCY=0
     VAR_result_is_sp_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_updated_d41d_uxn_opcodes_h_l171_c7_bfd4_return_output := result.is_sp_updated;

     -- BIN_OP_PLUS[uxn_opcodes_h_l184_c15_19e8] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l184_c15_19e8_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l184_c15_19e8_left;
     BIN_OP_PLUS_uxn_opcodes_h_l184_c15_19e8_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l184_c15_19e8_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l184_c15_19e8_return_output := BIN_OP_PLUS_uxn_opcodes_h_l184_c15_19e8_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l187_l182_l177_l171_l166_DUPLICATE_309d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l187_l182_l177_l171_l166_DUPLICATE_309d_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l193_c11_b478] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l193_c11_b478_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l193_c11_b478_left;
     BIN_OP_EQ_uxn_opcodes_h_l193_c11_b478_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l193_c11_b478_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l193_c11_b478_return_output := BIN_OP_EQ_uxn_opcodes_h_l193_c11_b478_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_d41d_uxn_opcodes_h_l187_l182_l177_l171_l166_DUPLICATE_fd62 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_d41d_uxn_opcodes_h_l187_l182_l177_l171_l166_DUPLICATE_fd62_return_output := result.stack_address;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l193_l187_l182_l177_l171_DUPLICATE_964d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l193_l187_l182_l177_l171_DUPLICATE_964d_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l182_c11_5180] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l182_c11_5180_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l182_c11_5180_left;
     BIN_OP_EQ_uxn_opcodes_h_l182_c11_5180_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l182_c11_5180_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l182_c11_5180_return_output := BIN_OP_EQ_uxn_opcodes_h_l182_c11_5180_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l193_l166_l182_l187_DUPLICATE_9dfb LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l193_l166_l182_l187_DUPLICATE_9dfb_return_output := result.ram_addr;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l193_l182_l177_l171_l166_DUPLICATE_97d5 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l193_l182_l177_l171_l166_DUPLICATE_97d5_return_output := result.stack_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l177_l166_DUPLICATE_89bf LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l177_l166_DUPLICATE_89bf_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l187_c11_cb32] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l187_c11_cb32_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l187_c11_cb32_left;
     BIN_OP_EQ_uxn_opcodes_h_l187_c11_cb32_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l187_c11_cb32_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l187_c11_cb32_return_output := BIN_OP_EQ_uxn_opcodes_h_l187_c11_cb32_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l166_c6_bc3e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l166_c6_bc3e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c6_bc3e_left;
     BIN_OP_EQ_uxn_opcodes_h_l166_c6_bc3e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c6_bc3e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c6_bc3e_return_output := BIN_OP_EQ_uxn_opcodes_h_l166_c6_bc3e_return_output;

     -- Submodule level 1
     VAR_lit_tmp8_MUX_uxn_opcodes_h_l166_c2_a0c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c6_bc3e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c2_a0c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c6_bc3e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c2_a0c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c6_bc3e_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l166_c2_a0c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c6_bc3e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l166_c2_a0c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c6_bc3e_return_output;
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l166_c2_a0c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c6_bc3e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l166_c2_a0c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c6_bc3e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c2_a0c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c6_bc3e_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l166_c2_a0c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c6_bc3e_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l166_c2_a0c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c6_bc3e_return_output;
     VAR_result_sp_MUX_uxn_opcodes_h_l166_c2_a0c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c6_bc3e_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l166_c2_a0c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c6_bc3e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l166_c2_a0c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c6_bc3e_return_output;
     VAR_lit_tmp8_MUX_uxn_opcodes_h_l171_c7_bfd4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_f085_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_bfd4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_f085_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_bfd4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_f085_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_bfd4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_f085_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l171_c7_bfd4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_f085_return_output;
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l171_c7_bfd4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_f085_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l171_c7_bfd4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_f085_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_bfd4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_f085_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l171_c7_bfd4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_f085_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l171_c7_bfd4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_f085_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l171_c7_bfd4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_f085_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l171_c7_bfd4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_f085_return_output;
     VAR_lit_tmp8_MUX_uxn_opcodes_h_l177_c7_8c4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l177_c11_59aa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_8c4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l177_c11_59aa_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_8c4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l177_c11_59aa_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l177_c7_8c4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l177_c11_59aa_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l177_c7_8c4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l177_c11_59aa_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l177_c7_8c4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l177_c11_59aa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l177_c7_8c4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l177_c11_59aa_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l177_c7_8c4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l177_c11_59aa_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l177_c7_8c4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l177_c11_59aa_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l177_c7_8c4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l177_c11_59aa_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l177_c7_8c4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l177_c11_59aa_return_output;
     VAR_lit_tmp8_MUX_uxn_opcodes_h_l182_c7_1326_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l182_c11_5180_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l182_c7_1326_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l182_c11_5180_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l182_c7_1326_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l182_c11_5180_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l182_c7_1326_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l182_c11_5180_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l182_c7_1326_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l182_c11_5180_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l182_c7_1326_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l182_c11_5180_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l182_c7_1326_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l182_c11_5180_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l182_c7_1326_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l182_c11_5180_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l182_c7_1326_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l182_c11_5180_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l182_c7_1326_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l182_c11_5180_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_91b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l187_c11_cb32_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_91b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l187_c11_cb32_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_91b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l187_c11_cb32_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l187_c7_91b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l187_c11_cb32_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l187_c7_91b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l187_c11_cb32_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l187_c7_91b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l187_c11_cb32_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l187_c7_91b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l187_c11_cb32_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l187_c7_91b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l187_c11_cb32_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l187_c7_91b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l187_c11_cb32_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_bdd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l193_c11_b478_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_bdd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l193_c11_b478_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_bdd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l193_c11_b478_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_bdd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l193_c11_b478_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l193_c7_bdd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l193_c11_b478_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l193_c7_bdd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l193_c11_b478_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l193_c7_bdd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l193_c11_b478_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l187_c7_91b3_iftrue := VAR_BIN_OP_MINUS_uxn_opcodes_h_l190_c26_ac53_return_output;
     VAR_result_sp_uxn_opcodes_h_l168_c3_a1fa := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l168_c15_dcac_return_output, 8);
     VAR_result_pc_uxn_opcodes_h_l184_c3_f0b8 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l184_c15_19e8_return_output, 16);
     VAR_result_pc_MUX_uxn_opcodes_h_l166_c2_a0c1_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l193_l187_l177_l171_l166_DUPLICATE_c225_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l171_c7_bfd4_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l193_l187_l177_l171_l166_DUPLICATE_c225_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l177_c7_8c4a_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l193_l187_l177_l171_l166_DUPLICATE_c225_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l187_c7_91b3_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l193_l187_l177_l171_l166_DUPLICATE_c225_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l193_c7_bdd8_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l193_l187_l177_l171_l166_DUPLICATE_c225_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l166_c2_a0c1_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l193_l166_l182_l187_DUPLICATE_9dfb_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l182_c7_1326_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l193_l166_l182_l187_DUPLICATE_9dfb_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l187_c7_91b3_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l193_l166_l182_l187_DUPLICATE_9dfb_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l193_c7_bdd8_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l193_l166_l182_l187_DUPLICATE_9dfb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_bfd4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l193_l187_l182_l177_l171_DUPLICATE_964d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_8c4a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l193_l187_l182_l177_l171_DUPLICATE_964d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l182_c7_1326_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l193_l187_l182_l177_l171_DUPLICATE_964d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_91b3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l193_l187_l182_l177_l171_DUPLICATE_964d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_bdd8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l193_l187_l182_l177_l171_DUPLICATE_964d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c2_a0c1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l193_l187_l177_l171_l166_DUPLICATE_ffe0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_bfd4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l193_l187_l177_l171_l166_DUPLICATE_ffe0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_8c4a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l193_l187_l177_l171_l166_DUPLICATE_ffe0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_91b3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l193_l187_l177_l171_l166_DUPLICATE_ffe0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_bdd8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l193_l187_l177_l171_l166_DUPLICATE_ffe0_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l166_c2_a0c1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l193_l166_l182_l187_DUPLICATE_a117_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l182_c7_1326_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l193_l166_l182_l187_DUPLICATE_a117_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_91b3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l193_l166_l182_l187_DUPLICATE_a117_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_bdd8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l193_l166_l182_l187_DUPLICATE_a117_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l166_c2_a0c1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l177_l166_DUPLICATE_89bf_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l177_c7_8c4a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l177_l166_DUPLICATE_89bf_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l166_c2_a0c1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l187_l182_l177_l171_l166_DUPLICATE_309d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l171_c7_bfd4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l187_l182_l177_l171_l166_DUPLICATE_309d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l177_c7_8c4a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l187_l182_l177_l171_l166_DUPLICATE_309d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l182_c7_1326_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l187_l182_l177_l171_l166_DUPLICATE_309d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l187_c7_91b3_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l187_l182_l177_l171_l166_DUPLICATE_309d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c2_a0c1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l193_l182_l177_l171_l166_DUPLICATE_22df_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_bfd4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l193_l182_l177_l171_l166_DUPLICATE_22df_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l177_c7_8c4a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l193_l182_l177_l171_l166_DUPLICATE_22df_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l182_c7_1326_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l193_l182_l177_l171_l166_DUPLICATE_22df_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_bdd8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l193_l182_l177_l171_l166_DUPLICATE_22df_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l166_c2_a0c1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_d41d_uxn_opcodes_h_l187_l182_l177_l171_l166_DUPLICATE_fd62_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l171_c7_bfd4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_d41d_uxn_opcodes_h_l187_l182_l177_l171_l166_DUPLICATE_fd62_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l177_c7_8c4a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_d41d_uxn_opcodes_h_l187_l182_l177_l171_l166_DUPLICATE_fd62_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l182_c7_1326_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_d41d_uxn_opcodes_h_l187_l182_l177_l171_l166_DUPLICATE_fd62_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l187_c7_91b3_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_d41d_uxn_opcodes_h_l187_l182_l177_l171_l166_DUPLICATE_fd62_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l166_c2_a0c1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l193_l182_l177_l171_l166_DUPLICATE_97d5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l171_c7_bfd4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l193_l182_l177_l171_l166_DUPLICATE_97d5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l177_c7_8c4a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l193_l182_l177_l171_l166_DUPLICATE_97d5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l182_c7_1326_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l193_l182_l177_l171_l166_DUPLICATE_97d5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l193_c7_bdd8_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l193_l182_l177_l171_l166_DUPLICATE_97d5_return_output;
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l171_c7_bfd4_iffalse := VAR_result_is_sp_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_updated_d41d_uxn_opcodes_h_l171_c7_bfd4_return_output;
     VAR_result_sp_MUX_uxn_opcodes_h_l166_c2_a0c1_iffalse := VAR_result_sp_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_sp_d41d_uxn_opcodes_h_l166_c2_a0c1_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l182_c7_1326_iftrue := VAR_result_pc_uxn_opcodes_h_l184_c3_f0b8;
     VAR_result_sp_MUX_uxn_opcodes_h_l166_c2_a0c1_iftrue := VAR_result_sp_uxn_opcodes_h_l168_c3_a1fa;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l193_c7_bdd8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_bdd8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_bdd8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_bdd8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_bdd8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_bdd8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_bdd8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_bdd8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_bdd8_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l193_c7_bdd8] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_bdd8_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_bdd8_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_bdd8_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_bdd8_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_bdd8_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_bdd8_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_bdd8_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_bdd8_return_output;

     -- result_sp_MUX[uxn_opcodes_h_l166_c2_a0c1] LATENCY=0
     -- Inputs
     result_sp_MUX_uxn_opcodes_h_l166_c2_a0c1_cond <= VAR_result_sp_MUX_uxn_opcodes_h_l166_c2_a0c1_cond;
     result_sp_MUX_uxn_opcodes_h_l166_c2_a0c1_iftrue <= VAR_result_sp_MUX_uxn_opcodes_h_l166_c2_a0c1_iftrue;
     result_sp_MUX_uxn_opcodes_h_l166_c2_a0c1_iffalse <= VAR_result_sp_MUX_uxn_opcodes_h_l166_c2_a0c1_iffalse;
     -- Outputs
     VAR_result_sp_MUX_uxn_opcodes_h_l166_c2_a0c1_return_output := result_sp_MUX_uxn_opcodes_h_l166_c2_a0c1_return_output;

     -- result_stack_address_MUX[uxn_opcodes_h_l187_c7_91b3] LATENCY=0
     -- Inputs
     result_stack_address_MUX_uxn_opcodes_h_l187_c7_91b3_cond <= VAR_result_stack_address_MUX_uxn_opcodes_h_l187_c7_91b3_cond;
     result_stack_address_MUX_uxn_opcodes_h_l187_c7_91b3_iftrue <= VAR_result_stack_address_MUX_uxn_opcodes_h_l187_c7_91b3_iftrue;
     result_stack_address_MUX_uxn_opcodes_h_l187_c7_91b3_iffalse <= VAR_result_stack_address_MUX_uxn_opcodes_h_l187_c7_91b3_iffalse;
     -- Outputs
     VAR_result_stack_address_MUX_uxn_opcodes_h_l187_c7_91b3_return_output := result_stack_address_MUX_uxn_opcodes_h_l187_c7_91b3_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l193_c7_bdd8] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l193_c7_bdd8_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l193_c7_bdd8_cond;
     result_stack_value_MUX_uxn_opcodes_h_l193_c7_bdd8_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l193_c7_bdd8_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l193_c7_bdd8_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l193_c7_bdd8_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l193_c7_bdd8_return_output := result_stack_value_MUX_uxn_opcodes_h_l193_c7_bdd8_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l193_c7_bdd8] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l193_c7_bdd8_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l193_c7_bdd8_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l193_c7_bdd8_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l193_c7_bdd8_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l193_c7_bdd8_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l193_c7_bdd8_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l193_c7_bdd8_return_output := result_ram_addr_MUX_uxn_opcodes_h_l193_c7_bdd8_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l187_c7_91b3] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l187_c7_91b3_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l187_c7_91b3_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l187_c7_91b3_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l187_c7_91b3_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l187_c7_91b3_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l187_c7_91b3_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l187_c7_91b3_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l187_c7_91b3_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l193_c7_bdd8] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l193_c7_bdd8_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l193_c7_bdd8_cond;
     result_pc_MUX_uxn_opcodes_h_l193_c7_bdd8_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l193_c7_bdd8_iftrue;
     result_pc_MUX_uxn_opcodes_h_l193_c7_bdd8_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l193_c7_bdd8_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l193_c7_bdd8_return_output := result_pc_MUX_uxn_opcodes_h_l193_c7_bdd8_return_output;

     -- result_is_sp_updated_MUX[uxn_opcodes_h_l171_c7_bfd4] LATENCY=0
     -- Inputs
     result_is_sp_updated_MUX_uxn_opcodes_h_l171_c7_bfd4_cond <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l171_c7_bfd4_cond;
     result_is_sp_updated_MUX_uxn_opcodes_h_l171_c7_bfd4_iftrue <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l171_c7_bfd4_iftrue;
     result_is_sp_updated_MUX_uxn_opcodes_h_l171_c7_bfd4_iffalse <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l171_c7_bfd4_iffalse;
     -- Outputs
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l171_c7_bfd4_return_output := result_is_sp_updated_MUX_uxn_opcodes_h_l171_c7_bfd4_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l177_c7_8c4a] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l177_c7_8c4a_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l177_c7_8c4a_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l177_c7_8c4a_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l177_c7_8c4a_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l177_c7_8c4a_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l177_c7_8c4a_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l177_c7_8c4a_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l177_c7_8c4a_return_output;

     -- lit_tmp8_MUX[uxn_opcodes_h_l182_c7_1326] LATENCY=0
     -- Inputs
     lit_tmp8_MUX_uxn_opcodes_h_l182_c7_1326_cond <= VAR_lit_tmp8_MUX_uxn_opcodes_h_l182_c7_1326_cond;
     lit_tmp8_MUX_uxn_opcodes_h_l182_c7_1326_iftrue <= VAR_lit_tmp8_MUX_uxn_opcodes_h_l182_c7_1326_iftrue;
     lit_tmp8_MUX_uxn_opcodes_h_l182_c7_1326_iffalse <= VAR_lit_tmp8_MUX_uxn_opcodes_h_l182_c7_1326_iffalse;
     -- Outputs
     VAR_lit_tmp8_MUX_uxn_opcodes_h_l182_c7_1326_return_output := lit_tmp8_MUX_uxn_opcodes_h_l182_c7_1326_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l193_c7_bdd8] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_bdd8_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_bdd8_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_bdd8_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_bdd8_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_bdd8_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_bdd8_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_bdd8_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_bdd8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l193_c7_bdd8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_bdd8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_bdd8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_bdd8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_bdd8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_bdd8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_bdd8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_bdd8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_bdd8_return_output;

     -- Submodule level 2
     VAR_lit_tmp8_MUX_uxn_opcodes_h_l177_c7_8c4a_iffalse := VAR_lit_tmp8_MUX_uxn_opcodes_h_l182_c7_1326_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_91b3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_bdd8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_91b3_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_bdd8_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_91b3_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l193_c7_bdd8_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l171_c7_bfd4_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l177_c7_8c4a_return_output;
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l166_c2_a0c1_iffalse := VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l171_c7_bfd4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l182_c7_1326_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l187_c7_91b3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l187_c7_91b3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_bdd8_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l187_c7_91b3_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l193_c7_bdd8_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l187_c7_91b3_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l193_c7_bdd8_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l182_c7_1326_iffalse := VAR_result_stack_address_MUX_uxn_opcodes_h_l187_c7_91b3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l187_c7_91b3_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l193_c7_bdd8_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l187_c7_91b3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l187_c7_91b3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l187_c7_91b3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l187_c7_91b3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l187_c7_91b3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l187_c7_91b3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l187_c7_91b3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l187_c7_91b3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l187_c7_91b3_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l187_c7_91b3] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l187_c7_91b3_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l187_c7_91b3_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l187_c7_91b3_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l187_c7_91b3_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l187_c7_91b3_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l187_c7_91b3_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l187_c7_91b3_return_output := result_ram_addr_MUX_uxn_opcodes_h_l187_c7_91b3_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l171_c7_bfd4] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l171_c7_bfd4_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l171_c7_bfd4_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l171_c7_bfd4_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l171_c7_bfd4_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l171_c7_bfd4_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l171_c7_bfd4_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l171_c7_bfd4_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l171_c7_bfd4_return_output;

     -- result_is_sp_updated_MUX[uxn_opcodes_h_l166_c2_a0c1] LATENCY=0
     -- Inputs
     result_is_sp_updated_MUX_uxn_opcodes_h_l166_c2_a0c1_cond <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l166_c2_a0c1_cond;
     result_is_sp_updated_MUX_uxn_opcodes_h_l166_c2_a0c1_iftrue <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l166_c2_a0c1_iftrue;
     result_is_sp_updated_MUX_uxn_opcodes_h_l166_c2_a0c1_iffalse <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l166_c2_a0c1_iffalse;
     -- Outputs
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l166_c2_a0c1_return_output := result_is_sp_updated_MUX_uxn_opcodes_h_l166_c2_a0c1_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l187_c7_91b3] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l187_c7_91b3_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l187_c7_91b3_cond;
     result_stack_value_MUX_uxn_opcodes_h_l187_c7_91b3_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l187_c7_91b3_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l187_c7_91b3_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l187_c7_91b3_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l187_c7_91b3_return_output := result_stack_value_MUX_uxn_opcodes_h_l187_c7_91b3_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l187_c7_91b3] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_91b3_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_91b3_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_91b3_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_91b3_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_91b3_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_91b3_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_91b3_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_91b3_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l187_c7_91b3] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l187_c7_91b3_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l187_c7_91b3_cond;
     result_pc_MUX_uxn_opcodes_h_l187_c7_91b3_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l187_c7_91b3_iftrue;
     result_pc_MUX_uxn_opcodes_h_l187_c7_91b3_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l187_c7_91b3_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l187_c7_91b3_return_output := result_pc_MUX_uxn_opcodes_h_l187_c7_91b3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l187_c7_91b3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_91b3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_91b3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_91b3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_91b3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_91b3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_91b3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_91b3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_91b3_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l187_c7_91b3] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_91b3_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_91b3_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_91b3_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_91b3_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_91b3_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_91b3_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_91b3_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_91b3_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l182_c7_1326] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l182_c7_1326_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l182_c7_1326_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l182_c7_1326_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l182_c7_1326_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l182_c7_1326_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l182_c7_1326_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l182_c7_1326_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l182_c7_1326_return_output;

     -- lit_tmp8_MUX[uxn_opcodes_h_l177_c7_8c4a] LATENCY=0
     -- Inputs
     lit_tmp8_MUX_uxn_opcodes_h_l177_c7_8c4a_cond <= VAR_lit_tmp8_MUX_uxn_opcodes_h_l177_c7_8c4a_cond;
     lit_tmp8_MUX_uxn_opcodes_h_l177_c7_8c4a_iftrue <= VAR_lit_tmp8_MUX_uxn_opcodes_h_l177_c7_8c4a_iftrue;
     lit_tmp8_MUX_uxn_opcodes_h_l177_c7_8c4a_iffalse <= VAR_lit_tmp8_MUX_uxn_opcodes_h_l177_c7_8c4a_iffalse;
     -- Outputs
     VAR_lit_tmp8_MUX_uxn_opcodes_h_l177_c7_8c4a_return_output := lit_tmp8_MUX_uxn_opcodes_h_l177_c7_8c4a_return_output;

     -- result_stack_address_MUX[uxn_opcodes_h_l182_c7_1326] LATENCY=0
     -- Inputs
     result_stack_address_MUX_uxn_opcodes_h_l182_c7_1326_cond <= VAR_result_stack_address_MUX_uxn_opcodes_h_l182_c7_1326_cond;
     result_stack_address_MUX_uxn_opcodes_h_l182_c7_1326_iftrue <= VAR_result_stack_address_MUX_uxn_opcodes_h_l182_c7_1326_iftrue;
     result_stack_address_MUX_uxn_opcodes_h_l182_c7_1326_iffalse <= VAR_result_stack_address_MUX_uxn_opcodes_h_l182_c7_1326_iffalse;
     -- Outputs
     VAR_result_stack_address_MUX_uxn_opcodes_h_l182_c7_1326_return_output := result_stack_address_MUX_uxn_opcodes_h_l182_c7_1326_return_output;

     -- Submodule level 3
     VAR_lit_tmp8_MUX_uxn_opcodes_h_l171_c7_bfd4_iffalse := VAR_lit_tmp8_MUX_uxn_opcodes_h_l177_c7_8c4a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l182_c7_1326_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_91b3_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l182_c7_1326_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_91b3_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l182_c7_1326_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_91b3_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l166_c2_a0c1_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l171_c7_bfd4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l177_c7_8c4a_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l182_c7_1326_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l182_c7_1326_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l187_c7_91b3_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l182_c7_1326_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l187_c7_91b3_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l182_c7_1326_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l187_c7_91b3_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l177_c7_8c4a_iffalse := VAR_result_stack_address_MUX_uxn_opcodes_h_l182_c7_1326_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l182_c7_1326_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l187_c7_91b3_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l182_c7_1326] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l182_c7_1326_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l182_c7_1326_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l182_c7_1326_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l182_c7_1326_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l182_c7_1326_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l182_c7_1326_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l182_c7_1326_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l182_c7_1326_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l182_c7_1326] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l182_c7_1326_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l182_c7_1326_cond;
     result_pc_MUX_uxn_opcodes_h_l182_c7_1326_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l182_c7_1326_iftrue;
     result_pc_MUX_uxn_opcodes_h_l182_c7_1326_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l182_c7_1326_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l182_c7_1326_return_output := result_pc_MUX_uxn_opcodes_h_l182_c7_1326_return_output;

     -- result_stack_address_MUX[uxn_opcodes_h_l177_c7_8c4a] LATENCY=0
     -- Inputs
     result_stack_address_MUX_uxn_opcodes_h_l177_c7_8c4a_cond <= VAR_result_stack_address_MUX_uxn_opcodes_h_l177_c7_8c4a_cond;
     result_stack_address_MUX_uxn_opcodes_h_l177_c7_8c4a_iftrue <= VAR_result_stack_address_MUX_uxn_opcodes_h_l177_c7_8c4a_iftrue;
     result_stack_address_MUX_uxn_opcodes_h_l177_c7_8c4a_iffalse <= VAR_result_stack_address_MUX_uxn_opcodes_h_l177_c7_8c4a_iffalse;
     -- Outputs
     VAR_result_stack_address_MUX_uxn_opcodes_h_l177_c7_8c4a_return_output := result_stack_address_MUX_uxn_opcodes_h_l177_c7_8c4a_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l182_c7_1326] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l182_c7_1326_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l182_c7_1326_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l182_c7_1326_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l182_c7_1326_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l182_c7_1326_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l182_c7_1326_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l182_c7_1326_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l182_c7_1326_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l182_c7_1326] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l182_c7_1326_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l182_c7_1326_cond;
     result_stack_value_MUX_uxn_opcodes_h_l182_c7_1326_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l182_c7_1326_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l182_c7_1326_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l182_c7_1326_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l182_c7_1326_return_output := result_stack_value_MUX_uxn_opcodes_h_l182_c7_1326_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l166_c2_a0c1] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l166_c2_a0c1_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l166_c2_a0c1_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l166_c2_a0c1_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l166_c2_a0c1_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l166_c2_a0c1_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l166_c2_a0c1_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l166_c2_a0c1_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l166_c2_a0c1_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l182_c7_1326] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l182_c7_1326_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l182_c7_1326_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l182_c7_1326_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l182_c7_1326_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l182_c7_1326_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l182_c7_1326_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l182_c7_1326_return_output := result_ram_addr_MUX_uxn_opcodes_h_l182_c7_1326_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l177_c7_8c4a] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l177_c7_8c4a_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l177_c7_8c4a_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l177_c7_8c4a_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l177_c7_8c4a_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l177_c7_8c4a_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l177_c7_8c4a_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l177_c7_8c4a_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l177_c7_8c4a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l182_c7_1326] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l182_c7_1326_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l182_c7_1326_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l182_c7_1326_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l182_c7_1326_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l182_c7_1326_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l182_c7_1326_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l182_c7_1326_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l182_c7_1326_return_output;

     -- lit_tmp8_MUX[uxn_opcodes_h_l171_c7_bfd4] LATENCY=0
     -- Inputs
     lit_tmp8_MUX_uxn_opcodes_h_l171_c7_bfd4_cond <= VAR_lit_tmp8_MUX_uxn_opcodes_h_l171_c7_bfd4_cond;
     lit_tmp8_MUX_uxn_opcodes_h_l171_c7_bfd4_iftrue <= VAR_lit_tmp8_MUX_uxn_opcodes_h_l171_c7_bfd4_iftrue;
     lit_tmp8_MUX_uxn_opcodes_h_l171_c7_bfd4_iffalse <= VAR_lit_tmp8_MUX_uxn_opcodes_h_l171_c7_bfd4_iffalse;
     -- Outputs
     VAR_lit_tmp8_MUX_uxn_opcodes_h_l171_c7_bfd4_return_output := lit_tmp8_MUX_uxn_opcodes_h_l171_c7_bfd4_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l182_c7_1326] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l182_c7_1326_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l182_c7_1326_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l182_c7_1326_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l182_c7_1326_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l182_c7_1326_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l182_c7_1326_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l182_c7_1326_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l182_c7_1326_return_output;

     -- Submodule level 4
     VAR_lit_tmp8_MUX_uxn_opcodes_h_l166_c2_a0c1_iffalse := VAR_lit_tmp8_MUX_uxn_opcodes_h_l171_c7_bfd4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_8c4a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l182_c7_1326_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_8c4a_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l182_c7_1326_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l177_c7_8c4a_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l182_c7_1326_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l171_c7_bfd4_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l177_c7_8c4a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l177_c7_8c4a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l182_c7_1326_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l177_c7_8c4a_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l182_c7_1326_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l177_c7_8c4a_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l182_c7_1326_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l171_c7_bfd4_iffalse := VAR_result_stack_address_MUX_uxn_opcodes_h_l177_c7_8c4a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l177_c7_8c4a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l182_c7_1326_return_output;
     -- result_stack_address_MUX[uxn_opcodes_h_l171_c7_bfd4] LATENCY=0
     -- Inputs
     result_stack_address_MUX_uxn_opcodes_h_l171_c7_bfd4_cond <= VAR_result_stack_address_MUX_uxn_opcodes_h_l171_c7_bfd4_cond;
     result_stack_address_MUX_uxn_opcodes_h_l171_c7_bfd4_iftrue <= VAR_result_stack_address_MUX_uxn_opcodes_h_l171_c7_bfd4_iftrue;
     result_stack_address_MUX_uxn_opcodes_h_l171_c7_bfd4_iffalse <= VAR_result_stack_address_MUX_uxn_opcodes_h_l171_c7_bfd4_iffalse;
     -- Outputs
     VAR_result_stack_address_MUX_uxn_opcodes_h_l171_c7_bfd4_return_output := result_stack_address_MUX_uxn_opcodes_h_l171_c7_bfd4_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l171_c7_bfd4] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l171_c7_bfd4_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l171_c7_bfd4_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l171_c7_bfd4_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l171_c7_bfd4_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l171_c7_bfd4_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l171_c7_bfd4_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l171_c7_bfd4_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l171_c7_bfd4_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l177_c7_8c4a] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l177_c7_8c4a_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l177_c7_8c4a_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l177_c7_8c4a_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l177_c7_8c4a_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l177_c7_8c4a_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l177_c7_8c4a_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l177_c7_8c4a_return_output := result_ram_addr_MUX_uxn_opcodes_h_l177_c7_8c4a_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l177_c7_8c4a] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l177_c7_8c4a_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l177_c7_8c4a_cond;
     result_pc_MUX_uxn_opcodes_h_l177_c7_8c4a_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l177_c7_8c4a_iftrue;
     result_pc_MUX_uxn_opcodes_h_l177_c7_8c4a_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l177_c7_8c4a_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l177_c7_8c4a_return_output := result_pc_MUX_uxn_opcodes_h_l177_c7_8c4a_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l177_c7_8c4a] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_8c4a_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_8c4a_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_8c4a_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_8c4a_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_8c4a_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_8c4a_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_8c4a_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_8c4a_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l177_c7_8c4a] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l177_c7_8c4a_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l177_c7_8c4a_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l177_c7_8c4a_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l177_c7_8c4a_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l177_c7_8c4a_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l177_c7_8c4a_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l177_c7_8c4a_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l177_c7_8c4a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l177_c7_8c4a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_8c4a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_8c4a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_8c4a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_8c4a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_8c4a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_8c4a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_8c4a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_8c4a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l177_c7_8c4a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l177_c7_8c4a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l177_c7_8c4a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l177_c7_8c4a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l177_c7_8c4a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l177_c7_8c4a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l177_c7_8c4a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l177_c7_8c4a_return_output := result_stack_value_MUX_uxn_opcodes_h_l177_c7_8c4a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l177_c7_8c4a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l177_c7_8c4a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l177_c7_8c4a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l177_c7_8c4a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l177_c7_8c4a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l177_c7_8c4a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l177_c7_8c4a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l177_c7_8c4a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l177_c7_8c4a_return_output;

     -- lit_tmp8_MUX[uxn_opcodes_h_l166_c2_a0c1] LATENCY=0
     -- Inputs
     lit_tmp8_MUX_uxn_opcodes_h_l166_c2_a0c1_cond <= VAR_lit_tmp8_MUX_uxn_opcodes_h_l166_c2_a0c1_cond;
     lit_tmp8_MUX_uxn_opcodes_h_l166_c2_a0c1_iftrue <= VAR_lit_tmp8_MUX_uxn_opcodes_h_l166_c2_a0c1_iftrue;
     lit_tmp8_MUX_uxn_opcodes_h_l166_c2_a0c1_iffalse <= VAR_lit_tmp8_MUX_uxn_opcodes_h_l166_c2_a0c1_iffalse;
     -- Outputs
     VAR_lit_tmp8_MUX_uxn_opcodes_h_l166_c2_a0c1_return_output := lit_tmp8_MUX_uxn_opcodes_h_l166_c2_a0c1_return_output;

     -- Submodule level 5
     REG_VAR_lit_tmp8 := VAR_lit_tmp8_MUX_uxn_opcodes_h_l166_c2_a0c1_return_output;
     VAR_printf_uxn_opcodes_h_l203_c2_0e5f_uxn_opcodes_h_l203_c2_0e5f_arg4 := resize(VAR_lit_tmp8_MUX_uxn_opcodes_h_l166_c2_a0c1_return_output, 32);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_bfd4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_8c4a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_bfd4_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_8c4a_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_bfd4_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l177_c7_8c4a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l166_c2_a0c1_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l171_c7_bfd4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_bfd4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l177_c7_8c4a_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l171_c7_bfd4_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l177_c7_8c4a_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l171_c7_bfd4_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l177_c7_8c4a_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l166_c2_a0c1_iffalse := VAR_result_stack_address_MUX_uxn_opcodes_h_l171_c7_bfd4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l171_c7_bfd4_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l177_c7_8c4a_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l171_c7_bfd4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_bfd4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_bfd4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_bfd4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_bfd4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_bfd4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_bfd4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_bfd4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_bfd4_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l171_c7_bfd4] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l171_c7_bfd4_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l171_c7_bfd4_cond;
     result_pc_MUX_uxn_opcodes_h_l171_c7_bfd4_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l171_c7_bfd4_iftrue;
     result_pc_MUX_uxn_opcodes_h_l171_c7_bfd4_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l171_c7_bfd4_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l171_c7_bfd4_return_output := result_pc_MUX_uxn_opcodes_h_l171_c7_bfd4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l171_c7_bfd4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_bfd4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_bfd4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_bfd4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_bfd4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_bfd4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_bfd4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_bfd4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_bfd4_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l171_c7_bfd4] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_bfd4_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_bfd4_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_bfd4_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_bfd4_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_bfd4_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_bfd4_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_bfd4_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_bfd4_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l171_c7_bfd4] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l171_c7_bfd4_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l171_c7_bfd4_cond;
     result_stack_value_MUX_uxn_opcodes_h_l171_c7_bfd4_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l171_c7_bfd4_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l171_c7_bfd4_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l171_c7_bfd4_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l171_c7_bfd4_return_output := result_stack_value_MUX_uxn_opcodes_h_l171_c7_bfd4_return_output;

     -- result_stack_address_MUX[uxn_opcodes_h_l166_c2_a0c1] LATENCY=0
     -- Inputs
     result_stack_address_MUX_uxn_opcodes_h_l166_c2_a0c1_cond <= VAR_result_stack_address_MUX_uxn_opcodes_h_l166_c2_a0c1_cond;
     result_stack_address_MUX_uxn_opcodes_h_l166_c2_a0c1_iftrue <= VAR_result_stack_address_MUX_uxn_opcodes_h_l166_c2_a0c1_iftrue;
     result_stack_address_MUX_uxn_opcodes_h_l166_c2_a0c1_iffalse <= VAR_result_stack_address_MUX_uxn_opcodes_h_l166_c2_a0c1_iffalse;
     -- Outputs
     VAR_result_stack_address_MUX_uxn_opcodes_h_l166_c2_a0c1_return_output := result_stack_address_MUX_uxn_opcodes_h_l166_c2_a0c1_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l171_c7_bfd4] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l171_c7_bfd4_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l171_c7_bfd4_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l171_c7_bfd4_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l171_c7_bfd4_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l171_c7_bfd4_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l171_c7_bfd4_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l171_c7_bfd4_return_output := result_ram_addr_MUX_uxn_opcodes_h_l171_c7_bfd4_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l171_c7_bfd4] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_bfd4_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_bfd4_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_bfd4_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_bfd4_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_bfd4_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_bfd4_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_bfd4_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_bfd4_return_output;

     -- printf_uxn_opcodes_h_l203_c2_0e5f[uxn_opcodes_h_l203_c2_0e5f] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l203_c2_0e5f_uxn_opcodes_h_l203_c2_0e5f_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l203_c2_0e5f_uxn_opcodes_h_l203_c2_0e5f_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l203_c2_0e5f_uxn_opcodes_h_l203_c2_0e5f_arg0 <= VAR_printf_uxn_opcodes_h_l203_c2_0e5f_uxn_opcodes_h_l203_c2_0e5f_arg0;
     printf_uxn_opcodes_h_l203_c2_0e5f_uxn_opcodes_h_l203_c2_0e5f_arg1 <= VAR_printf_uxn_opcodes_h_l203_c2_0e5f_uxn_opcodes_h_l203_c2_0e5f_arg1;
     printf_uxn_opcodes_h_l203_c2_0e5f_uxn_opcodes_h_l203_c2_0e5f_arg2 <= VAR_printf_uxn_opcodes_h_l203_c2_0e5f_uxn_opcodes_h_l203_c2_0e5f_arg2;
     printf_uxn_opcodes_h_l203_c2_0e5f_uxn_opcodes_h_l203_c2_0e5f_arg3 <= VAR_printf_uxn_opcodes_h_l203_c2_0e5f_uxn_opcodes_h_l203_c2_0e5f_arg3;
     printf_uxn_opcodes_h_l203_c2_0e5f_uxn_opcodes_h_l203_c2_0e5f_arg4 <= VAR_printf_uxn_opcodes_h_l203_c2_0e5f_uxn_opcodes_h_l203_c2_0e5f_arg4;
     -- Outputs

     -- result_is_stack_read_MUX[uxn_opcodes_h_l166_c2_a0c1] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l166_c2_a0c1_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l166_c2_a0c1_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l166_c2_a0c1_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l166_c2_a0c1_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l166_c2_a0c1_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l166_c2_a0c1_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l166_c2_a0c1_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l166_c2_a0c1_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c2_a0c1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_bfd4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c2_a0c1_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_bfd4_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l166_c2_a0c1_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_bfd4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c2_a0c1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_bfd4_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l166_c2_a0c1_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l171_c7_bfd4_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l166_c2_a0c1_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l171_c7_bfd4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l166_c2_a0c1_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l171_c7_bfd4_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l166_c2_a0c1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l166_c2_a0c1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l166_c2_a0c1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l166_c2_a0c1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l166_c2_a0c1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l166_c2_a0c1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l166_c2_a0c1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l166_c2_a0c1_return_output := result_stack_value_MUX_uxn_opcodes_h_l166_c2_a0c1_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l166_c2_a0c1] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l166_c2_a0c1_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l166_c2_a0c1_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l166_c2_a0c1_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l166_c2_a0c1_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l166_c2_a0c1_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l166_c2_a0c1_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l166_c2_a0c1_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l166_c2_a0c1_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l166_c2_a0c1] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l166_c2_a0c1_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c2_a0c1_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l166_c2_a0c1_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c2_a0c1_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l166_c2_a0c1_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c2_a0c1_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c2_a0c1_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l166_c2_a0c1_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l166_c2_a0c1] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l166_c2_a0c1_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l166_c2_a0c1_cond;
     result_pc_MUX_uxn_opcodes_h_l166_c2_a0c1_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l166_c2_a0c1_iftrue;
     result_pc_MUX_uxn_opcodes_h_l166_c2_a0c1_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l166_c2_a0c1_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l166_c2_a0c1_return_output := result_pc_MUX_uxn_opcodes_h_l166_c2_a0c1_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l166_c2_a0c1] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l166_c2_a0c1_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l166_c2_a0c1_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l166_c2_a0c1_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l166_c2_a0c1_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l166_c2_a0c1_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l166_c2_a0c1_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l166_c2_a0c1_return_output := result_ram_addr_MUX_uxn_opcodes_h_l166_c2_a0c1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l166_c2_a0c1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l166_c2_a0c1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c2_a0c1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l166_c2_a0c1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c2_a0c1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l166_c2_a0c1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c2_a0c1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c2_a0c1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l166_c2_a0c1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l166_c2_a0c1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l166_c2_a0c1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c2_a0c1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l166_c2_a0c1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c2_a0c1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l166_c2_a0c1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c2_a0c1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c2_a0c1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l166_c2_a0c1_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_4937_uxn_opcodes_h_l205_l161_DUPLICATE_83ec LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4937_uxn_opcodes_h_l205_l161_DUPLICATE_83ec_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_4937(
     result,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l166_c2_a0c1_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c2_a0c1_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l166_c2_a0c1_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c2_a0c1_return_output,
     VAR_result_pc_MUX_uxn_opcodes_h_l166_c2_a0c1_return_output,
     VAR_result_sp_MUX_uxn_opcodes_h_l166_c2_a0c1_return_output,
     VAR_result_stack_address_MUX_uxn_opcodes_h_l166_c2_a0c1_return_output,
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l166_c2_a0c1_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c2_a0c1_return_output,
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l166_c2_a0c1_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l166_c2_a0c1_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l166_c2_a0c1_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4937_uxn_opcodes_h_l205_l161_DUPLICATE_83ec_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4937_uxn_opcodes_h_l205_l161_DUPLICATE_83ec_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_lit_tmp8 <= REG_VAR_lit_tmp8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     lit_tmp8 <= REG_COMB_lit_tmp8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
