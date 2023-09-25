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
-- Submodules: 155
entity ovr2_0CLK_aa545296 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 stack_index : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 sp : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ovr2_0CLK_aa545296;
architecture arch of ovr2_0CLK_aa545296 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l313_c6_261d]
signal BIN_OP_EQ_uxn_opcodes_h_l313_c6_261d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l313_c6_261d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l313_c6_261d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l313_c1_8a49]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l313_c1_8a49_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l313_c1_8a49_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l313_c1_8a49_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l313_c1_8a49_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l313_c2_a794]
signal n16_MUX_uxn_opcodes_h_l313_c2_a794_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l313_c2_a794_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l313_c2_a794_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l313_c2_a794_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l313_c2_a794]
signal result_stack_value_MUX_uxn_opcodes_h_l313_c2_a794_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l313_c2_a794_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l313_c2_a794_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l313_c2_a794_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l313_c2_a794]
signal result_is_opc_done_MUX_uxn_opcodes_h_l313_c2_a794_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l313_c2_a794_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l313_c2_a794_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l313_c2_a794_return_output : unsigned(0 downto 0);

-- result_sp_MUX[uxn_opcodes_h_l313_c2_a794]
signal result_sp_MUX_uxn_opcodes_h_l313_c2_a794_cond : unsigned(0 downto 0);
signal result_sp_MUX_uxn_opcodes_h_l313_c2_a794_iftrue : unsigned(7 downto 0);
signal result_sp_MUX_uxn_opcodes_h_l313_c2_a794_iffalse : unsigned(7 downto 0);
signal result_sp_MUX_uxn_opcodes_h_l313_c2_a794_return_output : unsigned(7 downto 0);

-- result_stack_address_MUX[uxn_opcodes_h_l313_c2_a794]
signal result_stack_address_MUX_uxn_opcodes_h_l313_c2_a794_cond : unsigned(0 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l313_c2_a794_iftrue : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l313_c2_a794_iffalse : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l313_c2_a794_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l313_c2_a794]
signal result_is_stack_read_MUX_uxn_opcodes_h_l313_c2_a794_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l313_c2_a794_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l313_c2_a794_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l313_c2_a794_return_output : unsigned(0 downto 0);

-- result_is_sp_updated_MUX[uxn_opcodes_h_l313_c2_a794]
signal result_is_sp_updated_MUX_uxn_opcodes_h_l313_c2_a794_cond : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l313_c2_a794_iftrue : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l313_c2_a794_iffalse : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l313_c2_a794_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l313_c2_a794]
signal result_is_stack_write_MUX_uxn_opcodes_h_l313_c2_a794_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l313_c2_a794_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l313_c2_a794_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l313_c2_a794_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l313_c2_a794]
signal t16_MUX_uxn_opcodes_h_l313_c2_a794_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l313_c2_a794_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l313_c2_a794_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l313_c2_a794_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l314_c3_9541[uxn_opcodes_h_l314_c3_9541]
signal printf_uxn_opcodes_h_l314_c3_9541_uxn_opcodes_h_l314_c3_9541_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l317_c26_de46]
signal BIN_OP_MINUS_uxn_opcodes_h_l317_c26_de46_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l317_c26_de46_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l317_c26_de46_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l320_c11_1c23]
signal BIN_OP_EQ_uxn_opcodes_h_l320_c11_1c23_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l320_c11_1c23_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l320_c11_1c23_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l320_c7_a123]
signal n16_MUX_uxn_opcodes_h_l320_c7_a123_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l320_c7_a123_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l320_c7_a123_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l320_c7_a123_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l320_c7_a123]
signal result_stack_value_MUX_uxn_opcodes_h_l320_c7_a123_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l320_c7_a123_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l320_c7_a123_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l320_c7_a123_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l320_c7_a123]
signal result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_a123_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_a123_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_a123_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_a123_return_output : unsigned(0 downto 0);

-- result_sp_MUX[uxn_opcodes_h_l320_c7_a123]
signal result_sp_MUX_uxn_opcodes_h_l320_c7_a123_cond : unsigned(0 downto 0);
signal result_sp_MUX_uxn_opcodes_h_l320_c7_a123_iftrue : unsigned(7 downto 0);
signal result_sp_MUX_uxn_opcodes_h_l320_c7_a123_iffalse : unsigned(7 downto 0);
signal result_sp_MUX_uxn_opcodes_h_l320_c7_a123_return_output : unsigned(7 downto 0);

-- result_stack_address_MUX[uxn_opcodes_h_l320_c7_a123]
signal result_stack_address_MUX_uxn_opcodes_h_l320_c7_a123_cond : unsigned(0 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l320_c7_a123_iftrue : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l320_c7_a123_iffalse : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l320_c7_a123_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l320_c7_a123]
signal result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_a123_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_a123_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_a123_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_a123_return_output : unsigned(0 downto 0);

-- result_is_sp_updated_MUX[uxn_opcodes_h_l320_c7_a123]
signal result_is_sp_updated_MUX_uxn_opcodes_h_l320_c7_a123_cond : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l320_c7_a123_iftrue : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l320_c7_a123_iffalse : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l320_c7_a123_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l320_c7_a123]
signal result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_a123_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_a123_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_a123_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_a123_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l320_c7_a123]
signal t16_MUX_uxn_opcodes_h_l320_c7_a123_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l320_c7_a123_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l320_c7_a123_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l320_c7_a123_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l322_c26_867b]
signal BIN_OP_MINUS_uxn_opcodes_h_l322_c26_867b_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l322_c26_867b_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l322_c26_867b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l324_c11_4057]
signal BIN_OP_EQ_uxn_opcodes_h_l324_c11_4057_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l324_c11_4057_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l324_c11_4057_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l324_c7_3000]
signal n16_MUX_uxn_opcodes_h_l324_c7_3000_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l324_c7_3000_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l324_c7_3000_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l324_c7_3000_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l324_c7_3000]
signal result_stack_value_MUX_uxn_opcodes_h_l324_c7_3000_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l324_c7_3000_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l324_c7_3000_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l324_c7_3000_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l324_c7_3000]
signal result_is_opc_done_MUX_uxn_opcodes_h_l324_c7_3000_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l324_c7_3000_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l324_c7_3000_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l324_c7_3000_return_output : unsigned(0 downto 0);

-- result_sp_MUX[uxn_opcodes_h_l324_c7_3000]
signal result_sp_MUX_uxn_opcodes_h_l324_c7_3000_cond : unsigned(0 downto 0);
signal result_sp_MUX_uxn_opcodes_h_l324_c7_3000_iftrue : unsigned(7 downto 0);
signal result_sp_MUX_uxn_opcodes_h_l324_c7_3000_iffalse : unsigned(7 downto 0);
signal result_sp_MUX_uxn_opcodes_h_l324_c7_3000_return_output : unsigned(7 downto 0);

-- result_stack_address_MUX[uxn_opcodes_h_l324_c7_3000]
signal result_stack_address_MUX_uxn_opcodes_h_l324_c7_3000_cond : unsigned(0 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l324_c7_3000_iftrue : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l324_c7_3000_iffalse : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l324_c7_3000_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l324_c7_3000]
signal result_is_stack_read_MUX_uxn_opcodes_h_l324_c7_3000_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l324_c7_3000_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l324_c7_3000_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l324_c7_3000_return_output : unsigned(0 downto 0);

-- result_is_sp_updated_MUX[uxn_opcodes_h_l324_c7_3000]
signal result_is_sp_updated_MUX_uxn_opcodes_h_l324_c7_3000_cond : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l324_c7_3000_iftrue : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l324_c7_3000_iffalse : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l324_c7_3000_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l324_c7_3000]
signal result_is_stack_write_MUX_uxn_opcodes_h_l324_c7_3000_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l324_c7_3000_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l324_c7_3000_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l324_c7_3000_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l324_c7_3000]
signal t16_MUX_uxn_opcodes_h_l324_c7_3000_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l324_c7_3000_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l324_c7_3000_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l324_c7_3000_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l328_c26_bd86]
signal BIN_OP_MINUS_uxn_opcodes_h_l328_c26_bd86_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l328_c26_bd86_right : unsigned(0 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l328_c26_bd86_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l330_c11_b8d3]
signal BIN_OP_EQ_uxn_opcodes_h_l330_c11_b8d3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l330_c11_b8d3_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l330_c11_b8d3_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l330_c7_b40c]
signal n16_MUX_uxn_opcodes_h_l330_c7_b40c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l330_c7_b40c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l330_c7_b40c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l330_c7_b40c_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l330_c7_b40c]
signal result_stack_value_MUX_uxn_opcodes_h_l330_c7_b40c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l330_c7_b40c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l330_c7_b40c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l330_c7_b40c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l330_c7_b40c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l330_c7_b40c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l330_c7_b40c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l330_c7_b40c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l330_c7_b40c_return_output : unsigned(0 downto 0);

-- result_sp_MUX[uxn_opcodes_h_l330_c7_b40c]
signal result_sp_MUX_uxn_opcodes_h_l330_c7_b40c_cond : unsigned(0 downto 0);
signal result_sp_MUX_uxn_opcodes_h_l330_c7_b40c_iftrue : unsigned(7 downto 0);
signal result_sp_MUX_uxn_opcodes_h_l330_c7_b40c_iffalse : unsigned(7 downto 0);
signal result_sp_MUX_uxn_opcodes_h_l330_c7_b40c_return_output : unsigned(7 downto 0);

-- result_stack_address_MUX[uxn_opcodes_h_l330_c7_b40c]
signal result_stack_address_MUX_uxn_opcodes_h_l330_c7_b40c_cond : unsigned(0 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l330_c7_b40c_iftrue : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l330_c7_b40c_iffalse : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l330_c7_b40c_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l330_c7_b40c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l330_c7_b40c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l330_c7_b40c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l330_c7_b40c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l330_c7_b40c_return_output : unsigned(0 downto 0);

-- result_is_sp_updated_MUX[uxn_opcodes_h_l330_c7_b40c]
signal result_is_sp_updated_MUX_uxn_opcodes_h_l330_c7_b40c_cond : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l330_c7_b40c_iftrue : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l330_c7_b40c_iffalse : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l330_c7_b40c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l330_c7_b40c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l330_c7_b40c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l330_c7_b40c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l330_c7_b40c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l330_c7_b40c_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l330_c7_b40c]
signal t16_MUX_uxn_opcodes_h_l330_c7_b40c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l330_c7_b40c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l330_c7_b40c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l330_c7_b40c_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l332_c26_2ca7]
signal BIN_OP_MINUS_uxn_opcodes_h_l332_c26_2ca7_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l332_c26_2ca7_right : unsigned(0 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l332_c26_2ca7_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l334_c11_06fd]
signal BIN_OP_EQ_uxn_opcodes_h_l334_c11_06fd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l334_c11_06fd_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l334_c11_06fd_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l334_c7_5e5c]
signal n16_MUX_uxn_opcodes_h_l334_c7_5e5c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l334_c7_5e5c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l334_c7_5e5c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l334_c7_5e5c_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l334_c7_5e5c]
signal result_stack_value_MUX_uxn_opcodes_h_l334_c7_5e5c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l334_c7_5e5c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l334_c7_5e5c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l334_c7_5e5c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l334_c7_5e5c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l334_c7_5e5c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l334_c7_5e5c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l334_c7_5e5c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l334_c7_5e5c_return_output : unsigned(0 downto 0);

-- result_sp_MUX[uxn_opcodes_h_l334_c7_5e5c]
signal result_sp_MUX_uxn_opcodes_h_l334_c7_5e5c_cond : unsigned(0 downto 0);
signal result_sp_MUX_uxn_opcodes_h_l334_c7_5e5c_iftrue : unsigned(7 downto 0);
signal result_sp_MUX_uxn_opcodes_h_l334_c7_5e5c_iffalse : unsigned(7 downto 0);
signal result_sp_MUX_uxn_opcodes_h_l334_c7_5e5c_return_output : unsigned(7 downto 0);

-- result_stack_address_MUX[uxn_opcodes_h_l334_c7_5e5c]
signal result_stack_address_MUX_uxn_opcodes_h_l334_c7_5e5c_cond : unsigned(0 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l334_c7_5e5c_iftrue : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l334_c7_5e5c_iffalse : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l334_c7_5e5c_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l334_c7_5e5c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l334_c7_5e5c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l334_c7_5e5c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l334_c7_5e5c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l334_c7_5e5c_return_output : unsigned(0 downto 0);

-- result_is_sp_updated_MUX[uxn_opcodes_h_l334_c7_5e5c]
signal result_is_sp_updated_MUX_uxn_opcodes_h_l334_c7_5e5c_cond : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l334_c7_5e5c_iftrue : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l334_c7_5e5c_iffalse : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l334_c7_5e5c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l334_c7_5e5c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l334_c7_5e5c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l334_c7_5e5c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l334_c7_5e5c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l334_c7_5e5c_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l334_c7_5e5c]
signal t16_MUX_uxn_opcodes_h_l334_c7_5e5c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l334_c7_5e5c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l334_c7_5e5c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l334_c7_5e5c_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l335_c3_61b6]
signal BIN_OP_OR_uxn_opcodes_h_l335_c3_61b6_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l335_c3_61b6_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l335_c3_61b6_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l337_c26_03a2]
signal BIN_OP_MINUS_uxn_opcodes_h_l337_c26_03a2_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l337_c26_03a2_right : unsigned(2 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l337_c26_03a2_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l339_c11_5fee]
signal BIN_OP_EQ_uxn_opcodes_h_l339_c11_5fee_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l339_c11_5fee_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l339_c11_5fee_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l339_c7_6b80]
signal n16_MUX_uxn_opcodes_h_l339_c7_6b80_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l339_c7_6b80_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l339_c7_6b80_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l339_c7_6b80_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l339_c7_6b80]
signal result_stack_value_MUX_uxn_opcodes_h_l339_c7_6b80_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l339_c7_6b80_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l339_c7_6b80_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l339_c7_6b80_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l339_c7_6b80]
signal result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_6b80_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_6b80_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_6b80_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_6b80_return_output : unsigned(0 downto 0);

-- result_sp_MUX[uxn_opcodes_h_l339_c7_6b80]
signal result_sp_MUX_uxn_opcodes_h_l339_c7_6b80_cond : unsigned(0 downto 0);
signal result_sp_MUX_uxn_opcodes_h_l339_c7_6b80_iftrue : unsigned(7 downto 0);
signal result_sp_MUX_uxn_opcodes_h_l339_c7_6b80_iffalse : unsigned(7 downto 0);
signal result_sp_MUX_uxn_opcodes_h_l339_c7_6b80_return_output : unsigned(7 downto 0);

-- result_stack_address_MUX[uxn_opcodes_h_l339_c7_6b80]
signal result_stack_address_MUX_uxn_opcodes_h_l339_c7_6b80_cond : unsigned(0 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l339_c7_6b80_iftrue : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l339_c7_6b80_iffalse : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l339_c7_6b80_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l339_c7_6b80]
signal result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_6b80_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_6b80_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_6b80_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_6b80_return_output : unsigned(0 downto 0);

-- result_is_sp_updated_MUX[uxn_opcodes_h_l339_c7_6b80]
signal result_is_sp_updated_MUX_uxn_opcodes_h_l339_c7_6b80_cond : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l339_c7_6b80_iftrue : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l339_c7_6b80_iffalse : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l339_c7_6b80_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l339_c7_6b80]
signal result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_6b80_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_6b80_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_6b80_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_6b80_return_output : unsigned(0 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l341_c26_14cd]
signal BIN_OP_MINUS_uxn_opcodes_h_l341_c26_14cd_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l341_c26_14cd_right : unsigned(2 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l341_c26_14cd_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l343_c11_bae3]
signal BIN_OP_EQ_uxn_opcodes_h_l343_c11_bae3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l343_c11_bae3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l343_c11_bae3_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l343_c7_e415]
signal n16_MUX_uxn_opcodes_h_l343_c7_e415_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l343_c7_e415_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l343_c7_e415_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l343_c7_e415_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l343_c7_e415]
signal result_stack_value_MUX_uxn_opcodes_h_l343_c7_e415_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l343_c7_e415_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l343_c7_e415_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l343_c7_e415_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l343_c7_e415]
signal result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_e415_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_e415_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_e415_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_e415_return_output : unsigned(0 downto 0);

-- result_sp_MUX[uxn_opcodes_h_l343_c7_e415]
signal result_sp_MUX_uxn_opcodes_h_l343_c7_e415_cond : unsigned(0 downto 0);
signal result_sp_MUX_uxn_opcodes_h_l343_c7_e415_iftrue : unsigned(7 downto 0);
signal result_sp_MUX_uxn_opcodes_h_l343_c7_e415_iffalse : unsigned(7 downto 0);
signal result_sp_MUX_uxn_opcodes_h_l343_c7_e415_return_output : unsigned(7 downto 0);

-- result_stack_address_MUX[uxn_opcodes_h_l343_c7_e415]
signal result_stack_address_MUX_uxn_opcodes_h_l343_c7_e415_cond : unsigned(0 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l343_c7_e415_iftrue : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l343_c7_e415_iffalse : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l343_c7_e415_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l343_c7_e415]
signal result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_e415_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_e415_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_e415_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_e415_return_output : unsigned(0 downto 0);

-- result_is_sp_updated_MUX[uxn_opcodes_h_l343_c7_e415]
signal result_is_sp_updated_MUX_uxn_opcodes_h_l343_c7_e415_cond : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l343_c7_e415_iftrue : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l343_c7_e415_iffalse : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l343_c7_e415_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l343_c7_e415]
signal result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_e415_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_e415_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_e415_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_e415_return_output : unsigned(0 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l347_c26_5bef]
signal BIN_OP_MINUS_uxn_opcodes_h_l347_c26_5bef_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l347_c26_5bef_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l347_c26_5bef_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l349_c11_f6c4]
signal BIN_OP_EQ_uxn_opcodes_h_l349_c11_f6c4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l349_c11_f6c4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l349_c11_f6c4_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l349_c7_6611]
signal n16_MUX_uxn_opcodes_h_l349_c7_6611_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l349_c7_6611_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l349_c7_6611_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l349_c7_6611_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l349_c7_6611]
signal result_stack_value_MUX_uxn_opcodes_h_l349_c7_6611_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l349_c7_6611_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l349_c7_6611_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l349_c7_6611_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l349_c7_6611]
signal result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_6611_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_6611_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_6611_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_6611_return_output : unsigned(0 downto 0);

-- result_sp_MUX[uxn_opcodes_h_l349_c7_6611]
signal result_sp_MUX_uxn_opcodes_h_l349_c7_6611_cond : unsigned(0 downto 0);
signal result_sp_MUX_uxn_opcodes_h_l349_c7_6611_iftrue : unsigned(7 downto 0);
signal result_sp_MUX_uxn_opcodes_h_l349_c7_6611_iffalse : unsigned(7 downto 0);
signal result_sp_MUX_uxn_opcodes_h_l349_c7_6611_return_output : unsigned(7 downto 0);

-- result_stack_address_MUX[uxn_opcodes_h_l349_c7_6611]
signal result_stack_address_MUX_uxn_opcodes_h_l349_c7_6611_cond : unsigned(0 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l349_c7_6611_iftrue : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l349_c7_6611_iffalse : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l349_c7_6611_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l349_c7_6611]
signal result_is_stack_read_MUX_uxn_opcodes_h_l349_c7_6611_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l349_c7_6611_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l349_c7_6611_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l349_c7_6611_return_output : unsigned(0 downto 0);

-- result_is_sp_updated_MUX[uxn_opcodes_h_l349_c7_6611]
signal result_is_sp_updated_MUX_uxn_opcodes_h_l349_c7_6611_cond : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l349_c7_6611_iftrue : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l349_c7_6611_iffalse : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l349_c7_6611_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l349_c7_6611]
signal result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_6611_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_6611_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_6611_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_6611_return_output : unsigned(0 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l351_c26_9c30]
signal BIN_OP_MINUS_uxn_opcodes_h_l351_c26_9c30_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l351_c26_9c30_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l351_c26_9c30_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l353_c11_e984]
signal BIN_OP_EQ_uxn_opcodes_h_l353_c11_e984_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l353_c11_e984_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l353_c11_e984_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l353_c7_be86]
signal n16_MUX_uxn_opcodes_h_l353_c7_be86_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l353_c7_be86_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l353_c7_be86_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l353_c7_be86_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l353_c7_be86]
signal result_stack_value_MUX_uxn_opcodes_h_l353_c7_be86_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l353_c7_be86_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l353_c7_be86_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l353_c7_be86_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l353_c7_be86]
signal result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_be86_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_be86_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_be86_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_be86_return_output : unsigned(0 downto 0);

-- result_sp_MUX[uxn_opcodes_h_l353_c7_be86]
signal result_sp_MUX_uxn_opcodes_h_l353_c7_be86_cond : unsigned(0 downto 0);
signal result_sp_MUX_uxn_opcodes_h_l353_c7_be86_iftrue : unsigned(7 downto 0);
signal result_sp_MUX_uxn_opcodes_h_l353_c7_be86_iffalse : unsigned(7 downto 0);
signal result_sp_MUX_uxn_opcodes_h_l353_c7_be86_return_output : unsigned(7 downto 0);

-- result_stack_address_MUX[uxn_opcodes_h_l353_c7_be86]
signal result_stack_address_MUX_uxn_opcodes_h_l353_c7_be86_cond : unsigned(0 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l353_c7_be86_iftrue : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l353_c7_be86_iffalse : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l353_c7_be86_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l353_c7_be86]
signal result_is_stack_read_MUX_uxn_opcodes_h_l353_c7_be86_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l353_c7_be86_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l353_c7_be86_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l353_c7_be86_return_output : unsigned(0 downto 0);

-- result_is_sp_updated_MUX[uxn_opcodes_h_l353_c7_be86]
signal result_is_sp_updated_MUX_uxn_opcodes_h_l353_c7_be86_cond : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l353_c7_be86_iftrue : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l353_c7_be86_iffalse : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l353_c7_be86_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l353_c7_be86]
signal result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_be86_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_be86_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_be86_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_be86_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l354_c3_8140]
signal BIN_OP_OR_uxn_opcodes_h_l354_c3_8140_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l354_c3_8140_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l354_c3_8140_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l358_c16_465e]
signal BIN_OP_AND_uxn_opcodes_h_l358_c16_465e_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l358_c16_465e_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l358_c16_465e_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l358_c30_51f3]
signal BIN_OP_PLUS_uxn_opcodes_h_l358_c30_51f3_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l358_c30_51f3_right : unsigned(2 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l358_c30_51f3_return_output : unsigned(8 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l358_c39_f347]
signal BIN_OP_PLUS_uxn_opcodes_h_l358_c39_f347_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l358_c39_f347_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l358_c39_f347_return_output : unsigned(8 downto 0);

-- MUX[uxn_opcodes_h_l358_c16_17d6]
signal MUX_uxn_opcodes_h_l358_c16_17d6_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l358_c16_17d6_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l358_c16_17d6_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l358_c16_17d6_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l360_c11_8df0]
signal BIN_OP_EQ_uxn_opcodes_h_l360_c11_8df0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l360_c11_8df0_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l360_c11_8df0_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l360_c7_d038]
signal result_stack_value_MUX_uxn_opcodes_h_l360_c7_d038_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l360_c7_d038_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l360_c7_d038_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l360_c7_d038_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l360_c7_d038]
signal result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_d038_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_d038_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_d038_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_d038_return_output : unsigned(0 downto 0);

-- result_sp_MUX[uxn_opcodes_h_l360_c7_d038]
signal result_sp_MUX_uxn_opcodes_h_l360_c7_d038_cond : unsigned(0 downto 0);
signal result_sp_MUX_uxn_opcodes_h_l360_c7_d038_iftrue : unsigned(7 downto 0);
signal result_sp_MUX_uxn_opcodes_h_l360_c7_d038_iffalse : unsigned(7 downto 0);
signal result_sp_MUX_uxn_opcodes_h_l360_c7_d038_return_output : unsigned(7 downto 0);

-- result_stack_address_MUX[uxn_opcodes_h_l360_c7_d038]
signal result_stack_address_MUX_uxn_opcodes_h_l360_c7_d038_cond : unsigned(0 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l360_c7_d038_iftrue : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l360_c7_d038_iffalse : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l360_c7_d038_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l360_c7_d038]
signal result_is_stack_read_MUX_uxn_opcodes_h_l360_c7_d038_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l360_c7_d038_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l360_c7_d038_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l360_c7_d038_return_output : unsigned(0 downto 0);

-- result_is_sp_updated_MUX[uxn_opcodes_h_l360_c7_d038]
signal result_is_sp_updated_MUX_uxn_opcodes_h_l360_c7_d038_cond : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l360_c7_d038_iftrue : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l360_c7_d038_iffalse : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l360_c7_d038_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l360_c7_d038]
signal result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_d038_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_d038_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_d038_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_d038_return_output : unsigned(0 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l365_c26_d6d9]
signal BIN_OP_MINUS_uxn_opcodes_h_l365_c26_d6d9_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l365_c26_d6d9_right : unsigned(0 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l365_c26_d6d9_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l368_c11_d9e2]
signal BIN_OP_EQ_uxn_opcodes_h_l368_c11_d9e2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l368_c11_d9e2_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l368_c11_d9e2_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l368_c7_aa75]
signal result_stack_value_MUX_uxn_opcodes_h_l368_c7_aa75_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l368_c7_aa75_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l368_c7_aa75_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l368_c7_aa75_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l368_c7_aa75]
signal result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_aa75_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_aa75_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_aa75_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_aa75_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l368_c7_aa75]
signal result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_aa75_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_aa75_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_aa75_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_aa75_return_output : unsigned(0 downto 0);

-- result_stack_address_MUX[uxn_opcodes_h_l368_c7_aa75]
signal result_stack_address_MUX_uxn_opcodes_h_l368_c7_aa75_cond : unsigned(0 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l368_c7_aa75_iftrue : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l368_c7_aa75_iffalse : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l368_c7_aa75_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l370_c26_3039]
signal BIN_OP_MINUS_uxn_opcodes_h_l370_c26_3039_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l370_c26_3039_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l370_c26_3039_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l373_c11_7fc6]
signal BIN_OP_EQ_uxn_opcodes_h_l373_c11_7fc6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l373_c11_7fc6_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l373_c11_7fc6_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l373_c7_2ca9]
signal result_stack_value_MUX_uxn_opcodes_h_l373_c7_2ca9_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l373_c7_2ca9_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l373_c7_2ca9_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l373_c7_2ca9_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l373_c7_2ca9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_2ca9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_2ca9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_2ca9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_2ca9_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l373_c7_2ca9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_2ca9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_2ca9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_2ca9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_2ca9_return_output : unsigned(0 downto 0);

-- result_stack_address_MUX[uxn_opcodes_h_l373_c7_2ca9]
signal result_stack_address_MUX_uxn_opcodes_h_l373_c7_2ca9_cond : unsigned(0 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l373_c7_2ca9_iftrue : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l373_c7_2ca9_iffalse : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l373_c7_2ca9_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l375_c26_1610]
signal BIN_OP_MINUS_uxn_opcodes_h_l375_c26_1610_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l375_c26_1610_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l375_c26_1610_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l378_c11_c48e]
signal BIN_OP_EQ_uxn_opcodes_h_l378_c11_c48e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l378_c11_c48e_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l378_c11_c48e_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l378_c7_0826]
signal result_stack_value_MUX_uxn_opcodes_h_l378_c7_0826_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l378_c7_0826_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l378_c7_0826_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l378_c7_0826_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l378_c7_0826]
signal result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_0826_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_0826_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_0826_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_0826_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l378_c7_0826]
signal result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_0826_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_0826_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_0826_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_0826_return_output : unsigned(0 downto 0);

-- result_stack_address_MUX[uxn_opcodes_h_l378_c7_0826]
signal result_stack_address_MUX_uxn_opcodes_h_l378_c7_0826_cond : unsigned(0 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l378_c7_0826_iftrue : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l378_c7_0826_iffalse : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l378_c7_0826_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l380_c26_3d9b]
signal BIN_OP_MINUS_uxn_opcodes_h_l380_c26_3d9b_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l380_c26_3d9b_right : unsigned(2 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l380_c26_3d9b_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l381_c34_f704]
signal CONST_SR_8_uxn_opcodes_h_l381_c34_f704_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l381_c34_f704_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l383_c11_ac62]
signal BIN_OP_EQ_uxn_opcodes_h_l383_c11_ac62_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l383_c11_ac62_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l383_c11_ac62_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l383_c7_7401]
signal result_stack_value_MUX_uxn_opcodes_h_l383_c7_7401_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l383_c7_7401_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l383_c7_7401_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l383_c7_7401_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l383_c7_7401]
signal result_is_opc_done_MUX_uxn_opcodes_h_l383_c7_7401_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l383_c7_7401_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l383_c7_7401_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l383_c7_7401_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l383_c7_7401]
signal result_is_stack_write_MUX_uxn_opcodes_h_l383_c7_7401_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l383_c7_7401_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l383_c7_7401_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l383_c7_7401_return_output : unsigned(0 downto 0);

-- result_stack_address_MUX[uxn_opcodes_h_l383_c7_7401]
signal result_stack_address_MUX_uxn_opcodes_h_l383_c7_7401_cond : unsigned(0 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l383_c7_7401_iftrue : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l383_c7_7401_iffalse : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l383_c7_7401_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l385_c26_312e]
signal BIN_OP_MINUS_uxn_opcodes_h_l385_c26_312e_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l385_c26_312e_right : unsigned(2 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l385_c26_312e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l388_c11_efb3]
signal BIN_OP_EQ_uxn_opcodes_h_l388_c11_efb3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l388_c11_efb3_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l388_c11_efb3_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l388_c7_4091]
signal result_stack_value_MUX_uxn_opcodes_h_l388_c7_4091_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l388_c7_4091_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l388_c7_4091_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l388_c7_4091_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l388_c7_4091]
signal result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4091_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4091_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4091_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4091_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l388_c7_4091]
signal result_is_stack_write_MUX_uxn_opcodes_h_l388_c7_4091_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l388_c7_4091_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l388_c7_4091_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l388_c7_4091_return_output : unsigned(0 downto 0);

-- result_stack_address_MUX[uxn_opcodes_h_l388_c7_4091]
signal result_stack_address_MUX_uxn_opcodes_h_l388_c7_4091_cond : unsigned(0 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l388_c7_4091_iftrue : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l388_c7_4091_iffalse : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l388_c7_4091_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l390_c26_a3f0]
signal BIN_OP_MINUS_uxn_opcodes_h_l390_c26_a3f0_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l390_c26_a3f0_right : unsigned(2 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l390_c26_a3f0_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l393_c11_d57d]
signal BIN_OP_EQ_uxn_opcodes_h_l393_c11_d57d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l393_c11_d57d_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l393_c11_d57d_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l393_c7_0008]
signal result_stack_value_MUX_uxn_opcodes_h_l393_c7_0008_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l393_c7_0008_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l393_c7_0008_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l393_c7_0008_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l393_c7_0008]
signal result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_0008_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_0008_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_0008_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_0008_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l393_c7_0008]
signal result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_0008_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_0008_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_0008_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_0008_return_output : unsigned(0 downto 0);

-- result_stack_address_MUX[uxn_opcodes_h_l393_c7_0008]
signal result_stack_address_MUX_uxn_opcodes_h_l393_c7_0008_cond : unsigned(0 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l393_c7_0008_iftrue : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l393_c7_0008_iffalse : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l393_c7_0008_return_output : unsigned(7 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l345_l326_DUPLICATE_4a5d
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l345_l326_DUPLICATE_4a5d_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l345_l326_DUPLICATE_4a5d_return_output : unsigned(15 downto 0);

-- CONST_SR_8_uint16_t_uxn_opcodes_h_l391_l371_DUPLICATE_2205
signal CONST_SR_8_uint16_t_uxn_opcodes_h_l391_l371_DUPLICATE_2205_x : unsigned(15 downto 0);
signal CONST_SR_8_uint16_t_uxn_opcodes_h_l391_l371_DUPLICATE_2205_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_a3be( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_value := ref_toks_1;
      base.is_opc_done := ref_toks_2;
      base.sp := ref_toks_3;
      base.stack_address := ref_toks_4;
      base.is_stack_read := ref_toks_5;
      base.is_sp_updated := ref_toks_6;
      base.is_stack_write := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l313_c6_261d
BIN_OP_EQ_uxn_opcodes_h_l313_c6_261d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l313_c6_261d_left,
BIN_OP_EQ_uxn_opcodes_h_l313_c6_261d_right,
BIN_OP_EQ_uxn_opcodes_h_l313_c6_261d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l313_c1_8a49
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l313_c1_8a49 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l313_c1_8a49_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l313_c1_8a49_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l313_c1_8a49_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l313_c1_8a49_return_output);

-- n16_MUX_uxn_opcodes_h_l313_c2_a794
n16_MUX_uxn_opcodes_h_l313_c2_a794 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l313_c2_a794_cond,
n16_MUX_uxn_opcodes_h_l313_c2_a794_iftrue,
n16_MUX_uxn_opcodes_h_l313_c2_a794_iffalse,
n16_MUX_uxn_opcodes_h_l313_c2_a794_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l313_c2_a794
result_stack_value_MUX_uxn_opcodes_h_l313_c2_a794 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l313_c2_a794_cond,
result_stack_value_MUX_uxn_opcodes_h_l313_c2_a794_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l313_c2_a794_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l313_c2_a794_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l313_c2_a794
result_is_opc_done_MUX_uxn_opcodes_h_l313_c2_a794 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l313_c2_a794_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l313_c2_a794_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l313_c2_a794_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l313_c2_a794_return_output);

-- result_sp_MUX_uxn_opcodes_h_l313_c2_a794
result_sp_MUX_uxn_opcodes_h_l313_c2_a794 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_sp_MUX_uxn_opcodes_h_l313_c2_a794_cond,
result_sp_MUX_uxn_opcodes_h_l313_c2_a794_iftrue,
result_sp_MUX_uxn_opcodes_h_l313_c2_a794_iffalse,
result_sp_MUX_uxn_opcodes_h_l313_c2_a794_return_output);

-- result_stack_address_MUX_uxn_opcodes_h_l313_c2_a794
result_stack_address_MUX_uxn_opcodes_h_l313_c2_a794 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_MUX_uxn_opcodes_h_l313_c2_a794_cond,
result_stack_address_MUX_uxn_opcodes_h_l313_c2_a794_iftrue,
result_stack_address_MUX_uxn_opcodes_h_l313_c2_a794_iffalse,
result_stack_address_MUX_uxn_opcodes_h_l313_c2_a794_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l313_c2_a794
result_is_stack_read_MUX_uxn_opcodes_h_l313_c2_a794 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l313_c2_a794_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l313_c2_a794_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l313_c2_a794_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l313_c2_a794_return_output);

-- result_is_sp_updated_MUX_uxn_opcodes_h_l313_c2_a794
result_is_sp_updated_MUX_uxn_opcodes_h_l313_c2_a794 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_updated_MUX_uxn_opcodes_h_l313_c2_a794_cond,
result_is_sp_updated_MUX_uxn_opcodes_h_l313_c2_a794_iftrue,
result_is_sp_updated_MUX_uxn_opcodes_h_l313_c2_a794_iffalse,
result_is_sp_updated_MUX_uxn_opcodes_h_l313_c2_a794_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l313_c2_a794
result_is_stack_write_MUX_uxn_opcodes_h_l313_c2_a794 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l313_c2_a794_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l313_c2_a794_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l313_c2_a794_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l313_c2_a794_return_output);

-- t16_MUX_uxn_opcodes_h_l313_c2_a794
t16_MUX_uxn_opcodes_h_l313_c2_a794 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l313_c2_a794_cond,
t16_MUX_uxn_opcodes_h_l313_c2_a794_iftrue,
t16_MUX_uxn_opcodes_h_l313_c2_a794_iffalse,
t16_MUX_uxn_opcodes_h_l313_c2_a794_return_output);

-- printf_uxn_opcodes_h_l314_c3_9541_uxn_opcodes_h_l314_c3_9541
printf_uxn_opcodes_h_l314_c3_9541_uxn_opcodes_h_l314_c3_9541 : entity work.printf_uxn_opcodes_h_l314_c3_9541_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l314_c3_9541_uxn_opcodes_h_l314_c3_9541_CLOCK_ENABLE);

-- BIN_OP_MINUS_uxn_opcodes_h_l317_c26_de46
BIN_OP_MINUS_uxn_opcodes_h_l317_c26_de46 : entity work.BIN_OP_MINUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l317_c26_de46_left,
BIN_OP_MINUS_uxn_opcodes_h_l317_c26_de46_right,
BIN_OP_MINUS_uxn_opcodes_h_l317_c26_de46_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l320_c11_1c23
BIN_OP_EQ_uxn_opcodes_h_l320_c11_1c23 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l320_c11_1c23_left,
BIN_OP_EQ_uxn_opcodes_h_l320_c11_1c23_right,
BIN_OP_EQ_uxn_opcodes_h_l320_c11_1c23_return_output);

-- n16_MUX_uxn_opcodes_h_l320_c7_a123
n16_MUX_uxn_opcodes_h_l320_c7_a123 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l320_c7_a123_cond,
n16_MUX_uxn_opcodes_h_l320_c7_a123_iftrue,
n16_MUX_uxn_opcodes_h_l320_c7_a123_iffalse,
n16_MUX_uxn_opcodes_h_l320_c7_a123_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l320_c7_a123
result_stack_value_MUX_uxn_opcodes_h_l320_c7_a123 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l320_c7_a123_cond,
result_stack_value_MUX_uxn_opcodes_h_l320_c7_a123_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l320_c7_a123_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l320_c7_a123_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_a123
result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_a123 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_a123_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_a123_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_a123_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_a123_return_output);

-- result_sp_MUX_uxn_opcodes_h_l320_c7_a123
result_sp_MUX_uxn_opcodes_h_l320_c7_a123 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_sp_MUX_uxn_opcodes_h_l320_c7_a123_cond,
result_sp_MUX_uxn_opcodes_h_l320_c7_a123_iftrue,
result_sp_MUX_uxn_opcodes_h_l320_c7_a123_iffalse,
result_sp_MUX_uxn_opcodes_h_l320_c7_a123_return_output);

-- result_stack_address_MUX_uxn_opcodes_h_l320_c7_a123
result_stack_address_MUX_uxn_opcodes_h_l320_c7_a123 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_MUX_uxn_opcodes_h_l320_c7_a123_cond,
result_stack_address_MUX_uxn_opcodes_h_l320_c7_a123_iftrue,
result_stack_address_MUX_uxn_opcodes_h_l320_c7_a123_iffalse,
result_stack_address_MUX_uxn_opcodes_h_l320_c7_a123_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_a123
result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_a123 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_a123_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_a123_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_a123_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_a123_return_output);

-- result_is_sp_updated_MUX_uxn_opcodes_h_l320_c7_a123
result_is_sp_updated_MUX_uxn_opcodes_h_l320_c7_a123 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_updated_MUX_uxn_opcodes_h_l320_c7_a123_cond,
result_is_sp_updated_MUX_uxn_opcodes_h_l320_c7_a123_iftrue,
result_is_sp_updated_MUX_uxn_opcodes_h_l320_c7_a123_iffalse,
result_is_sp_updated_MUX_uxn_opcodes_h_l320_c7_a123_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_a123
result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_a123 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_a123_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_a123_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_a123_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_a123_return_output);

-- t16_MUX_uxn_opcodes_h_l320_c7_a123
t16_MUX_uxn_opcodes_h_l320_c7_a123 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l320_c7_a123_cond,
t16_MUX_uxn_opcodes_h_l320_c7_a123_iftrue,
t16_MUX_uxn_opcodes_h_l320_c7_a123_iffalse,
t16_MUX_uxn_opcodes_h_l320_c7_a123_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l322_c26_867b
BIN_OP_MINUS_uxn_opcodes_h_l322_c26_867b : entity work.BIN_OP_MINUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l322_c26_867b_left,
BIN_OP_MINUS_uxn_opcodes_h_l322_c26_867b_right,
BIN_OP_MINUS_uxn_opcodes_h_l322_c26_867b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l324_c11_4057
BIN_OP_EQ_uxn_opcodes_h_l324_c11_4057 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l324_c11_4057_left,
BIN_OP_EQ_uxn_opcodes_h_l324_c11_4057_right,
BIN_OP_EQ_uxn_opcodes_h_l324_c11_4057_return_output);

-- n16_MUX_uxn_opcodes_h_l324_c7_3000
n16_MUX_uxn_opcodes_h_l324_c7_3000 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l324_c7_3000_cond,
n16_MUX_uxn_opcodes_h_l324_c7_3000_iftrue,
n16_MUX_uxn_opcodes_h_l324_c7_3000_iffalse,
n16_MUX_uxn_opcodes_h_l324_c7_3000_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l324_c7_3000
result_stack_value_MUX_uxn_opcodes_h_l324_c7_3000 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l324_c7_3000_cond,
result_stack_value_MUX_uxn_opcodes_h_l324_c7_3000_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l324_c7_3000_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l324_c7_3000_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l324_c7_3000
result_is_opc_done_MUX_uxn_opcodes_h_l324_c7_3000 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l324_c7_3000_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l324_c7_3000_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l324_c7_3000_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l324_c7_3000_return_output);

-- result_sp_MUX_uxn_opcodes_h_l324_c7_3000
result_sp_MUX_uxn_opcodes_h_l324_c7_3000 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_sp_MUX_uxn_opcodes_h_l324_c7_3000_cond,
result_sp_MUX_uxn_opcodes_h_l324_c7_3000_iftrue,
result_sp_MUX_uxn_opcodes_h_l324_c7_3000_iffalse,
result_sp_MUX_uxn_opcodes_h_l324_c7_3000_return_output);

-- result_stack_address_MUX_uxn_opcodes_h_l324_c7_3000
result_stack_address_MUX_uxn_opcodes_h_l324_c7_3000 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_MUX_uxn_opcodes_h_l324_c7_3000_cond,
result_stack_address_MUX_uxn_opcodes_h_l324_c7_3000_iftrue,
result_stack_address_MUX_uxn_opcodes_h_l324_c7_3000_iffalse,
result_stack_address_MUX_uxn_opcodes_h_l324_c7_3000_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l324_c7_3000
result_is_stack_read_MUX_uxn_opcodes_h_l324_c7_3000 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l324_c7_3000_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l324_c7_3000_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l324_c7_3000_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l324_c7_3000_return_output);

-- result_is_sp_updated_MUX_uxn_opcodes_h_l324_c7_3000
result_is_sp_updated_MUX_uxn_opcodes_h_l324_c7_3000 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_updated_MUX_uxn_opcodes_h_l324_c7_3000_cond,
result_is_sp_updated_MUX_uxn_opcodes_h_l324_c7_3000_iftrue,
result_is_sp_updated_MUX_uxn_opcodes_h_l324_c7_3000_iffalse,
result_is_sp_updated_MUX_uxn_opcodes_h_l324_c7_3000_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l324_c7_3000
result_is_stack_write_MUX_uxn_opcodes_h_l324_c7_3000 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l324_c7_3000_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l324_c7_3000_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l324_c7_3000_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l324_c7_3000_return_output);

-- t16_MUX_uxn_opcodes_h_l324_c7_3000
t16_MUX_uxn_opcodes_h_l324_c7_3000 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l324_c7_3000_cond,
t16_MUX_uxn_opcodes_h_l324_c7_3000_iftrue,
t16_MUX_uxn_opcodes_h_l324_c7_3000_iffalse,
t16_MUX_uxn_opcodes_h_l324_c7_3000_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l328_c26_bd86
BIN_OP_MINUS_uxn_opcodes_h_l328_c26_bd86 : entity work.BIN_OP_MINUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l328_c26_bd86_left,
BIN_OP_MINUS_uxn_opcodes_h_l328_c26_bd86_right,
BIN_OP_MINUS_uxn_opcodes_h_l328_c26_bd86_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l330_c11_b8d3
BIN_OP_EQ_uxn_opcodes_h_l330_c11_b8d3 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l330_c11_b8d3_left,
BIN_OP_EQ_uxn_opcodes_h_l330_c11_b8d3_right,
BIN_OP_EQ_uxn_opcodes_h_l330_c11_b8d3_return_output);

-- n16_MUX_uxn_opcodes_h_l330_c7_b40c
n16_MUX_uxn_opcodes_h_l330_c7_b40c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l330_c7_b40c_cond,
n16_MUX_uxn_opcodes_h_l330_c7_b40c_iftrue,
n16_MUX_uxn_opcodes_h_l330_c7_b40c_iffalse,
n16_MUX_uxn_opcodes_h_l330_c7_b40c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l330_c7_b40c
result_stack_value_MUX_uxn_opcodes_h_l330_c7_b40c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l330_c7_b40c_cond,
result_stack_value_MUX_uxn_opcodes_h_l330_c7_b40c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l330_c7_b40c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l330_c7_b40c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l330_c7_b40c
result_is_opc_done_MUX_uxn_opcodes_h_l330_c7_b40c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l330_c7_b40c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l330_c7_b40c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l330_c7_b40c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l330_c7_b40c_return_output);

-- result_sp_MUX_uxn_opcodes_h_l330_c7_b40c
result_sp_MUX_uxn_opcodes_h_l330_c7_b40c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_sp_MUX_uxn_opcodes_h_l330_c7_b40c_cond,
result_sp_MUX_uxn_opcodes_h_l330_c7_b40c_iftrue,
result_sp_MUX_uxn_opcodes_h_l330_c7_b40c_iffalse,
result_sp_MUX_uxn_opcodes_h_l330_c7_b40c_return_output);

-- result_stack_address_MUX_uxn_opcodes_h_l330_c7_b40c
result_stack_address_MUX_uxn_opcodes_h_l330_c7_b40c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_MUX_uxn_opcodes_h_l330_c7_b40c_cond,
result_stack_address_MUX_uxn_opcodes_h_l330_c7_b40c_iftrue,
result_stack_address_MUX_uxn_opcodes_h_l330_c7_b40c_iffalse,
result_stack_address_MUX_uxn_opcodes_h_l330_c7_b40c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l330_c7_b40c
result_is_stack_read_MUX_uxn_opcodes_h_l330_c7_b40c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l330_c7_b40c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l330_c7_b40c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l330_c7_b40c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l330_c7_b40c_return_output);

-- result_is_sp_updated_MUX_uxn_opcodes_h_l330_c7_b40c
result_is_sp_updated_MUX_uxn_opcodes_h_l330_c7_b40c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_updated_MUX_uxn_opcodes_h_l330_c7_b40c_cond,
result_is_sp_updated_MUX_uxn_opcodes_h_l330_c7_b40c_iftrue,
result_is_sp_updated_MUX_uxn_opcodes_h_l330_c7_b40c_iffalse,
result_is_sp_updated_MUX_uxn_opcodes_h_l330_c7_b40c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l330_c7_b40c
result_is_stack_write_MUX_uxn_opcodes_h_l330_c7_b40c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l330_c7_b40c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l330_c7_b40c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l330_c7_b40c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l330_c7_b40c_return_output);

-- t16_MUX_uxn_opcodes_h_l330_c7_b40c
t16_MUX_uxn_opcodes_h_l330_c7_b40c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l330_c7_b40c_cond,
t16_MUX_uxn_opcodes_h_l330_c7_b40c_iftrue,
t16_MUX_uxn_opcodes_h_l330_c7_b40c_iffalse,
t16_MUX_uxn_opcodes_h_l330_c7_b40c_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l332_c26_2ca7
BIN_OP_MINUS_uxn_opcodes_h_l332_c26_2ca7 : entity work.BIN_OP_MINUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l332_c26_2ca7_left,
BIN_OP_MINUS_uxn_opcodes_h_l332_c26_2ca7_right,
BIN_OP_MINUS_uxn_opcodes_h_l332_c26_2ca7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l334_c11_06fd
BIN_OP_EQ_uxn_opcodes_h_l334_c11_06fd : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l334_c11_06fd_left,
BIN_OP_EQ_uxn_opcodes_h_l334_c11_06fd_right,
BIN_OP_EQ_uxn_opcodes_h_l334_c11_06fd_return_output);

-- n16_MUX_uxn_opcodes_h_l334_c7_5e5c
n16_MUX_uxn_opcodes_h_l334_c7_5e5c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l334_c7_5e5c_cond,
n16_MUX_uxn_opcodes_h_l334_c7_5e5c_iftrue,
n16_MUX_uxn_opcodes_h_l334_c7_5e5c_iffalse,
n16_MUX_uxn_opcodes_h_l334_c7_5e5c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l334_c7_5e5c
result_stack_value_MUX_uxn_opcodes_h_l334_c7_5e5c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l334_c7_5e5c_cond,
result_stack_value_MUX_uxn_opcodes_h_l334_c7_5e5c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l334_c7_5e5c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l334_c7_5e5c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l334_c7_5e5c
result_is_opc_done_MUX_uxn_opcodes_h_l334_c7_5e5c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l334_c7_5e5c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l334_c7_5e5c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l334_c7_5e5c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l334_c7_5e5c_return_output);

-- result_sp_MUX_uxn_opcodes_h_l334_c7_5e5c
result_sp_MUX_uxn_opcodes_h_l334_c7_5e5c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_sp_MUX_uxn_opcodes_h_l334_c7_5e5c_cond,
result_sp_MUX_uxn_opcodes_h_l334_c7_5e5c_iftrue,
result_sp_MUX_uxn_opcodes_h_l334_c7_5e5c_iffalse,
result_sp_MUX_uxn_opcodes_h_l334_c7_5e5c_return_output);

-- result_stack_address_MUX_uxn_opcodes_h_l334_c7_5e5c
result_stack_address_MUX_uxn_opcodes_h_l334_c7_5e5c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_MUX_uxn_opcodes_h_l334_c7_5e5c_cond,
result_stack_address_MUX_uxn_opcodes_h_l334_c7_5e5c_iftrue,
result_stack_address_MUX_uxn_opcodes_h_l334_c7_5e5c_iffalse,
result_stack_address_MUX_uxn_opcodes_h_l334_c7_5e5c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l334_c7_5e5c
result_is_stack_read_MUX_uxn_opcodes_h_l334_c7_5e5c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l334_c7_5e5c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l334_c7_5e5c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l334_c7_5e5c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l334_c7_5e5c_return_output);

-- result_is_sp_updated_MUX_uxn_opcodes_h_l334_c7_5e5c
result_is_sp_updated_MUX_uxn_opcodes_h_l334_c7_5e5c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_updated_MUX_uxn_opcodes_h_l334_c7_5e5c_cond,
result_is_sp_updated_MUX_uxn_opcodes_h_l334_c7_5e5c_iftrue,
result_is_sp_updated_MUX_uxn_opcodes_h_l334_c7_5e5c_iffalse,
result_is_sp_updated_MUX_uxn_opcodes_h_l334_c7_5e5c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l334_c7_5e5c
result_is_stack_write_MUX_uxn_opcodes_h_l334_c7_5e5c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l334_c7_5e5c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l334_c7_5e5c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l334_c7_5e5c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l334_c7_5e5c_return_output);

-- t16_MUX_uxn_opcodes_h_l334_c7_5e5c
t16_MUX_uxn_opcodes_h_l334_c7_5e5c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l334_c7_5e5c_cond,
t16_MUX_uxn_opcodes_h_l334_c7_5e5c_iftrue,
t16_MUX_uxn_opcodes_h_l334_c7_5e5c_iffalse,
t16_MUX_uxn_opcodes_h_l334_c7_5e5c_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l335_c3_61b6
BIN_OP_OR_uxn_opcodes_h_l335_c3_61b6 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l335_c3_61b6_left,
BIN_OP_OR_uxn_opcodes_h_l335_c3_61b6_right,
BIN_OP_OR_uxn_opcodes_h_l335_c3_61b6_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l337_c26_03a2
BIN_OP_MINUS_uxn_opcodes_h_l337_c26_03a2 : entity work.BIN_OP_MINUS_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l337_c26_03a2_left,
BIN_OP_MINUS_uxn_opcodes_h_l337_c26_03a2_right,
BIN_OP_MINUS_uxn_opcodes_h_l337_c26_03a2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l339_c11_5fee
BIN_OP_EQ_uxn_opcodes_h_l339_c11_5fee : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l339_c11_5fee_left,
BIN_OP_EQ_uxn_opcodes_h_l339_c11_5fee_right,
BIN_OP_EQ_uxn_opcodes_h_l339_c11_5fee_return_output);

-- n16_MUX_uxn_opcodes_h_l339_c7_6b80
n16_MUX_uxn_opcodes_h_l339_c7_6b80 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l339_c7_6b80_cond,
n16_MUX_uxn_opcodes_h_l339_c7_6b80_iftrue,
n16_MUX_uxn_opcodes_h_l339_c7_6b80_iffalse,
n16_MUX_uxn_opcodes_h_l339_c7_6b80_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l339_c7_6b80
result_stack_value_MUX_uxn_opcodes_h_l339_c7_6b80 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l339_c7_6b80_cond,
result_stack_value_MUX_uxn_opcodes_h_l339_c7_6b80_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l339_c7_6b80_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l339_c7_6b80_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_6b80
result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_6b80 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_6b80_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_6b80_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_6b80_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_6b80_return_output);

-- result_sp_MUX_uxn_opcodes_h_l339_c7_6b80
result_sp_MUX_uxn_opcodes_h_l339_c7_6b80 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_sp_MUX_uxn_opcodes_h_l339_c7_6b80_cond,
result_sp_MUX_uxn_opcodes_h_l339_c7_6b80_iftrue,
result_sp_MUX_uxn_opcodes_h_l339_c7_6b80_iffalse,
result_sp_MUX_uxn_opcodes_h_l339_c7_6b80_return_output);

-- result_stack_address_MUX_uxn_opcodes_h_l339_c7_6b80
result_stack_address_MUX_uxn_opcodes_h_l339_c7_6b80 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_MUX_uxn_opcodes_h_l339_c7_6b80_cond,
result_stack_address_MUX_uxn_opcodes_h_l339_c7_6b80_iftrue,
result_stack_address_MUX_uxn_opcodes_h_l339_c7_6b80_iffalse,
result_stack_address_MUX_uxn_opcodes_h_l339_c7_6b80_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_6b80
result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_6b80 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_6b80_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_6b80_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_6b80_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_6b80_return_output);

-- result_is_sp_updated_MUX_uxn_opcodes_h_l339_c7_6b80
result_is_sp_updated_MUX_uxn_opcodes_h_l339_c7_6b80 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_updated_MUX_uxn_opcodes_h_l339_c7_6b80_cond,
result_is_sp_updated_MUX_uxn_opcodes_h_l339_c7_6b80_iftrue,
result_is_sp_updated_MUX_uxn_opcodes_h_l339_c7_6b80_iffalse,
result_is_sp_updated_MUX_uxn_opcodes_h_l339_c7_6b80_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_6b80
result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_6b80 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_6b80_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_6b80_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_6b80_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_6b80_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l341_c26_14cd
BIN_OP_MINUS_uxn_opcodes_h_l341_c26_14cd : entity work.BIN_OP_MINUS_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l341_c26_14cd_left,
BIN_OP_MINUS_uxn_opcodes_h_l341_c26_14cd_right,
BIN_OP_MINUS_uxn_opcodes_h_l341_c26_14cd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l343_c11_bae3
BIN_OP_EQ_uxn_opcodes_h_l343_c11_bae3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l343_c11_bae3_left,
BIN_OP_EQ_uxn_opcodes_h_l343_c11_bae3_right,
BIN_OP_EQ_uxn_opcodes_h_l343_c11_bae3_return_output);

-- n16_MUX_uxn_opcodes_h_l343_c7_e415
n16_MUX_uxn_opcodes_h_l343_c7_e415 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l343_c7_e415_cond,
n16_MUX_uxn_opcodes_h_l343_c7_e415_iftrue,
n16_MUX_uxn_opcodes_h_l343_c7_e415_iffalse,
n16_MUX_uxn_opcodes_h_l343_c7_e415_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l343_c7_e415
result_stack_value_MUX_uxn_opcodes_h_l343_c7_e415 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l343_c7_e415_cond,
result_stack_value_MUX_uxn_opcodes_h_l343_c7_e415_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l343_c7_e415_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l343_c7_e415_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_e415
result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_e415 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_e415_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_e415_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_e415_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_e415_return_output);

-- result_sp_MUX_uxn_opcodes_h_l343_c7_e415
result_sp_MUX_uxn_opcodes_h_l343_c7_e415 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_sp_MUX_uxn_opcodes_h_l343_c7_e415_cond,
result_sp_MUX_uxn_opcodes_h_l343_c7_e415_iftrue,
result_sp_MUX_uxn_opcodes_h_l343_c7_e415_iffalse,
result_sp_MUX_uxn_opcodes_h_l343_c7_e415_return_output);

-- result_stack_address_MUX_uxn_opcodes_h_l343_c7_e415
result_stack_address_MUX_uxn_opcodes_h_l343_c7_e415 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_MUX_uxn_opcodes_h_l343_c7_e415_cond,
result_stack_address_MUX_uxn_opcodes_h_l343_c7_e415_iftrue,
result_stack_address_MUX_uxn_opcodes_h_l343_c7_e415_iffalse,
result_stack_address_MUX_uxn_opcodes_h_l343_c7_e415_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_e415
result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_e415 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_e415_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_e415_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_e415_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_e415_return_output);

-- result_is_sp_updated_MUX_uxn_opcodes_h_l343_c7_e415
result_is_sp_updated_MUX_uxn_opcodes_h_l343_c7_e415 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_updated_MUX_uxn_opcodes_h_l343_c7_e415_cond,
result_is_sp_updated_MUX_uxn_opcodes_h_l343_c7_e415_iftrue,
result_is_sp_updated_MUX_uxn_opcodes_h_l343_c7_e415_iffalse,
result_is_sp_updated_MUX_uxn_opcodes_h_l343_c7_e415_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_e415
result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_e415 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_e415_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_e415_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_e415_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_e415_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l347_c26_5bef
BIN_OP_MINUS_uxn_opcodes_h_l347_c26_5bef : entity work.BIN_OP_MINUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l347_c26_5bef_left,
BIN_OP_MINUS_uxn_opcodes_h_l347_c26_5bef_right,
BIN_OP_MINUS_uxn_opcodes_h_l347_c26_5bef_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l349_c11_f6c4
BIN_OP_EQ_uxn_opcodes_h_l349_c11_f6c4 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l349_c11_f6c4_left,
BIN_OP_EQ_uxn_opcodes_h_l349_c11_f6c4_right,
BIN_OP_EQ_uxn_opcodes_h_l349_c11_f6c4_return_output);

-- n16_MUX_uxn_opcodes_h_l349_c7_6611
n16_MUX_uxn_opcodes_h_l349_c7_6611 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l349_c7_6611_cond,
n16_MUX_uxn_opcodes_h_l349_c7_6611_iftrue,
n16_MUX_uxn_opcodes_h_l349_c7_6611_iffalse,
n16_MUX_uxn_opcodes_h_l349_c7_6611_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l349_c7_6611
result_stack_value_MUX_uxn_opcodes_h_l349_c7_6611 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l349_c7_6611_cond,
result_stack_value_MUX_uxn_opcodes_h_l349_c7_6611_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l349_c7_6611_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l349_c7_6611_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_6611
result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_6611 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_6611_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_6611_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_6611_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_6611_return_output);

-- result_sp_MUX_uxn_opcodes_h_l349_c7_6611
result_sp_MUX_uxn_opcodes_h_l349_c7_6611 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_sp_MUX_uxn_opcodes_h_l349_c7_6611_cond,
result_sp_MUX_uxn_opcodes_h_l349_c7_6611_iftrue,
result_sp_MUX_uxn_opcodes_h_l349_c7_6611_iffalse,
result_sp_MUX_uxn_opcodes_h_l349_c7_6611_return_output);

-- result_stack_address_MUX_uxn_opcodes_h_l349_c7_6611
result_stack_address_MUX_uxn_opcodes_h_l349_c7_6611 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_MUX_uxn_opcodes_h_l349_c7_6611_cond,
result_stack_address_MUX_uxn_opcodes_h_l349_c7_6611_iftrue,
result_stack_address_MUX_uxn_opcodes_h_l349_c7_6611_iffalse,
result_stack_address_MUX_uxn_opcodes_h_l349_c7_6611_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l349_c7_6611
result_is_stack_read_MUX_uxn_opcodes_h_l349_c7_6611 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l349_c7_6611_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l349_c7_6611_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l349_c7_6611_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l349_c7_6611_return_output);

-- result_is_sp_updated_MUX_uxn_opcodes_h_l349_c7_6611
result_is_sp_updated_MUX_uxn_opcodes_h_l349_c7_6611 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_updated_MUX_uxn_opcodes_h_l349_c7_6611_cond,
result_is_sp_updated_MUX_uxn_opcodes_h_l349_c7_6611_iftrue,
result_is_sp_updated_MUX_uxn_opcodes_h_l349_c7_6611_iffalse,
result_is_sp_updated_MUX_uxn_opcodes_h_l349_c7_6611_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_6611
result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_6611 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_6611_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_6611_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_6611_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_6611_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l351_c26_9c30
BIN_OP_MINUS_uxn_opcodes_h_l351_c26_9c30 : entity work.BIN_OP_MINUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l351_c26_9c30_left,
BIN_OP_MINUS_uxn_opcodes_h_l351_c26_9c30_right,
BIN_OP_MINUS_uxn_opcodes_h_l351_c26_9c30_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l353_c11_e984
BIN_OP_EQ_uxn_opcodes_h_l353_c11_e984 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l353_c11_e984_left,
BIN_OP_EQ_uxn_opcodes_h_l353_c11_e984_right,
BIN_OP_EQ_uxn_opcodes_h_l353_c11_e984_return_output);

-- n16_MUX_uxn_opcodes_h_l353_c7_be86
n16_MUX_uxn_opcodes_h_l353_c7_be86 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l353_c7_be86_cond,
n16_MUX_uxn_opcodes_h_l353_c7_be86_iftrue,
n16_MUX_uxn_opcodes_h_l353_c7_be86_iffalse,
n16_MUX_uxn_opcodes_h_l353_c7_be86_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l353_c7_be86
result_stack_value_MUX_uxn_opcodes_h_l353_c7_be86 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l353_c7_be86_cond,
result_stack_value_MUX_uxn_opcodes_h_l353_c7_be86_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l353_c7_be86_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l353_c7_be86_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_be86
result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_be86 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_be86_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_be86_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_be86_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_be86_return_output);

-- result_sp_MUX_uxn_opcodes_h_l353_c7_be86
result_sp_MUX_uxn_opcodes_h_l353_c7_be86 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_sp_MUX_uxn_opcodes_h_l353_c7_be86_cond,
result_sp_MUX_uxn_opcodes_h_l353_c7_be86_iftrue,
result_sp_MUX_uxn_opcodes_h_l353_c7_be86_iffalse,
result_sp_MUX_uxn_opcodes_h_l353_c7_be86_return_output);

-- result_stack_address_MUX_uxn_opcodes_h_l353_c7_be86
result_stack_address_MUX_uxn_opcodes_h_l353_c7_be86 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_MUX_uxn_opcodes_h_l353_c7_be86_cond,
result_stack_address_MUX_uxn_opcodes_h_l353_c7_be86_iftrue,
result_stack_address_MUX_uxn_opcodes_h_l353_c7_be86_iffalse,
result_stack_address_MUX_uxn_opcodes_h_l353_c7_be86_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l353_c7_be86
result_is_stack_read_MUX_uxn_opcodes_h_l353_c7_be86 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l353_c7_be86_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l353_c7_be86_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l353_c7_be86_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l353_c7_be86_return_output);

-- result_is_sp_updated_MUX_uxn_opcodes_h_l353_c7_be86
result_is_sp_updated_MUX_uxn_opcodes_h_l353_c7_be86 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_updated_MUX_uxn_opcodes_h_l353_c7_be86_cond,
result_is_sp_updated_MUX_uxn_opcodes_h_l353_c7_be86_iftrue,
result_is_sp_updated_MUX_uxn_opcodes_h_l353_c7_be86_iffalse,
result_is_sp_updated_MUX_uxn_opcodes_h_l353_c7_be86_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_be86
result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_be86 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_be86_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_be86_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_be86_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_be86_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l354_c3_8140
BIN_OP_OR_uxn_opcodes_h_l354_c3_8140 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l354_c3_8140_left,
BIN_OP_OR_uxn_opcodes_h_l354_c3_8140_right,
BIN_OP_OR_uxn_opcodes_h_l354_c3_8140_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l358_c16_465e
BIN_OP_AND_uxn_opcodes_h_l358_c16_465e : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l358_c16_465e_left,
BIN_OP_AND_uxn_opcodes_h_l358_c16_465e_right,
BIN_OP_AND_uxn_opcodes_h_l358_c16_465e_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l358_c30_51f3
BIN_OP_PLUS_uxn_opcodes_h_l358_c30_51f3 : entity work.BIN_OP_PLUS_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l358_c30_51f3_left,
BIN_OP_PLUS_uxn_opcodes_h_l358_c30_51f3_right,
BIN_OP_PLUS_uxn_opcodes_h_l358_c30_51f3_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l358_c39_f347
BIN_OP_PLUS_uxn_opcodes_h_l358_c39_f347 : entity work.BIN_OP_PLUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l358_c39_f347_left,
BIN_OP_PLUS_uxn_opcodes_h_l358_c39_f347_right,
BIN_OP_PLUS_uxn_opcodes_h_l358_c39_f347_return_output);

-- MUX_uxn_opcodes_h_l358_c16_17d6
MUX_uxn_opcodes_h_l358_c16_17d6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l358_c16_17d6_cond,
MUX_uxn_opcodes_h_l358_c16_17d6_iftrue,
MUX_uxn_opcodes_h_l358_c16_17d6_iffalse,
MUX_uxn_opcodes_h_l358_c16_17d6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l360_c11_8df0
BIN_OP_EQ_uxn_opcodes_h_l360_c11_8df0 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l360_c11_8df0_left,
BIN_OP_EQ_uxn_opcodes_h_l360_c11_8df0_right,
BIN_OP_EQ_uxn_opcodes_h_l360_c11_8df0_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l360_c7_d038
result_stack_value_MUX_uxn_opcodes_h_l360_c7_d038 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l360_c7_d038_cond,
result_stack_value_MUX_uxn_opcodes_h_l360_c7_d038_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l360_c7_d038_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l360_c7_d038_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_d038
result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_d038 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_d038_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_d038_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_d038_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_d038_return_output);

-- result_sp_MUX_uxn_opcodes_h_l360_c7_d038
result_sp_MUX_uxn_opcodes_h_l360_c7_d038 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_sp_MUX_uxn_opcodes_h_l360_c7_d038_cond,
result_sp_MUX_uxn_opcodes_h_l360_c7_d038_iftrue,
result_sp_MUX_uxn_opcodes_h_l360_c7_d038_iffalse,
result_sp_MUX_uxn_opcodes_h_l360_c7_d038_return_output);

-- result_stack_address_MUX_uxn_opcodes_h_l360_c7_d038
result_stack_address_MUX_uxn_opcodes_h_l360_c7_d038 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_MUX_uxn_opcodes_h_l360_c7_d038_cond,
result_stack_address_MUX_uxn_opcodes_h_l360_c7_d038_iftrue,
result_stack_address_MUX_uxn_opcodes_h_l360_c7_d038_iffalse,
result_stack_address_MUX_uxn_opcodes_h_l360_c7_d038_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l360_c7_d038
result_is_stack_read_MUX_uxn_opcodes_h_l360_c7_d038 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l360_c7_d038_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l360_c7_d038_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l360_c7_d038_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l360_c7_d038_return_output);

-- result_is_sp_updated_MUX_uxn_opcodes_h_l360_c7_d038
result_is_sp_updated_MUX_uxn_opcodes_h_l360_c7_d038 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_updated_MUX_uxn_opcodes_h_l360_c7_d038_cond,
result_is_sp_updated_MUX_uxn_opcodes_h_l360_c7_d038_iftrue,
result_is_sp_updated_MUX_uxn_opcodes_h_l360_c7_d038_iffalse,
result_is_sp_updated_MUX_uxn_opcodes_h_l360_c7_d038_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_d038
result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_d038 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_d038_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_d038_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_d038_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_d038_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l365_c26_d6d9
BIN_OP_MINUS_uxn_opcodes_h_l365_c26_d6d9 : entity work.BIN_OP_MINUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l365_c26_d6d9_left,
BIN_OP_MINUS_uxn_opcodes_h_l365_c26_d6d9_right,
BIN_OP_MINUS_uxn_opcodes_h_l365_c26_d6d9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l368_c11_d9e2
BIN_OP_EQ_uxn_opcodes_h_l368_c11_d9e2 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l368_c11_d9e2_left,
BIN_OP_EQ_uxn_opcodes_h_l368_c11_d9e2_right,
BIN_OP_EQ_uxn_opcodes_h_l368_c11_d9e2_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l368_c7_aa75
result_stack_value_MUX_uxn_opcodes_h_l368_c7_aa75 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l368_c7_aa75_cond,
result_stack_value_MUX_uxn_opcodes_h_l368_c7_aa75_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l368_c7_aa75_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l368_c7_aa75_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_aa75
result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_aa75 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_aa75_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_aa75_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_aa75_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_aa75_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_aa75
result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_aa75 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_aa75_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_aa75_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_aa75_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_aa75_return_output);

-- result_stack_address_MUX_uxn_opcodes_h_l368_c7_aa75
result_stack_address_MUX_uxn_opcodes_h_l368_c7_aa75 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_MUX_uxn_opcodes_h_l368_c7_aa75_cond,
result_stack_address_MUX_uxn_opcodes_h_l368_c7_aa75_iftrue,
result_stack_address_MUX_uxn_opcodes_h_l368_c7_aa75_iffalse,
result_stack_address_MUX_uxn_opcodes_h_l368_c7_aa75_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l370_c26_3039
BIN_OP_MINUS_uxn_opcodes_h_l370_c26_3039 : entity work.BIN_OP_MINUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l370_c26_3039_left,
BIN_OP_MINUS_uxn_opcodes_h_l370_c26_3039_right,
BIN_OP_MINUS_uxn_opcodes_h_l370_c26_3039_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l373_c11_7fc6
BIN_OP_EQ_uxn_opcodes_h_l373_c11_7fc6 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l373_c11_7fc6_left,
BIN_OP_EQ_uxn_opcodes_h_l373_c11_7fc6_right,
BIN_OP_EQ_uxn_opcodes_h_l373_c11_7fc6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l373_c7_2ca9
result_stack_value_MUX_uxn_opcodes_h_l373_c7_2ca9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l373_c7_2ca9_cond,
result_stack_value_MUX_uxn_opcodes_h_l373_c7_2ca9_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l373_c7_2ca9_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l373_c7_2ca9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_2ca9
result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_2ca9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_2ca9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_2ca9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_2ca9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_2ca9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_2ca9
result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_2ca9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_2ca9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_2ca9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_2ca9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_2ca9_return_output);

-- result_stack_address_MUX_uxn_opcodes_h_l373_c7_2ca9
result_stack_address_MUX_uxn_opcodes_h_l373_c7_2ca9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_MUX_uxn_opcodes_h_l373_c7_2ca9_cond,
result_stack_address_MUX_uxn_opcodes_h_l373_c7_2ca9_iftrue,
result_stack_address_MUX_uxn_opcodes_h_l373_c7_2ca9_iffalse,
result_stack_address_MUX_uxn_opcodes_h_l373_c7_2ca9_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l375_c26_1610
BIN_OP_MINUS_uxn_opcodes_h_l375_c26_1610 : entity work.BIN_OP_MINUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l375_c26_1610_left,
BIN_OP_MINUS_uxn_opcodes_h_l375_c26_1610_right,
BIN_OP_MINUS_uxn_opcodes_h_l375_c26_1610_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l378_c11_c48e
BIN_OP_EQ_uxn_opcodes_h_l378_c11_c48e : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l378_c11_c48e_left,
BIN_OP_EQ_uxn_opcodes_h_l378_c11_c48e_right,
BIN_OP_EQ_uxn_opcodes_h_l378_c11_c48e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l378_c7_0826
result_stack_value_MUX_uxn_opcodes_h_l378_c7_0826 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l378_c7_0826_cond,
result_stack_value_MUX_uxn_opcodes_h_l378_c7_0826_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l378_c7_0826_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l378_c7_0826_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_0826
result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_0826 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_0826_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_0826_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_0826_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_0826_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_0826
result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_0826 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_0826_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_0826_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_0826_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_0826_return_output);

-- result_stack_address_MUX_uxn_opcodes_h_l378_c7_0826
result_stack_address_MUX_uxn_opcodes_h_l378_c7_0826 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_MUX_uxn_opcodes_h_l378_c7_0826_cond,
result_stack_address_MUX_uxn_opcodes_h_l378_c7_0826_iftrue,
result_stack_address_MUX_uxn_opcodes_h_l378_c7_0826_iffalse,
result_stack_address_MUX_uxn_opcodes_h_l378_c7_0826_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l380_c26_3d9b
BIN_OP_MINUS_uxn_opcodes_h_l380_c26_3d9b : entity work.BIN_OP_MINUS_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l380_c26_3d9b_left,
BIN_OP_MINUS_uxn_opcodes_h_l380_c26_3d9b_right,
BIN_OP_MINUS_uxn_opcodes_h_l380_c26_3d9b_return_output);

-- CONST_SR_8_uxn_opcodes_h_l381_c34_f704
CONST_SR_8_uxn_opcodes_h_l381_c34_f704 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l381_c34_f704_x,
CONST_SR_8_uxn_opcodes_h_l381_c34_f704_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l383_c11_ac62
BIN_OP_EQ_uxn_opcodes_h_l383_c11_ac62 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l383_c11_ac62_left,
BIN_OP_EQ_uxn_opcodes_h_l383_c11_ac62_right,
BIN_OP_EQ_uxn_opcodes_h_l383_c11_ac62_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l383_c7_7401
result_stack_value_MUX_uxn_opcodes_h_l383_c7_7401 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l383_c7_7401_cond,
result_stack_value_MUX_uxn_opcodes_h_l383_c7_7401_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l383_c7_7401_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l383_c7_7401_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l383_c7_7401
result_is_opc_done_MUX_uxn_opcodes_h_l383_c7_7401 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l383_c7_7401_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l383_c7_7401_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l383_c7_7401_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l383_c7_7401_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l383_c7_7401
result_is_stack_write_MUX_uxn_opcodes_h_l383_c7_7401 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l383_c7_7401_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l383_c7_7401_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l383_c7_7401_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l383_c7_7401_return_output);

-- result_stack_address_MUX_uxn_opcodes_h_l383_c7_7401
result_stack_address_MUX_uxn_opcodes_h_l383_c7_7401 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_MUX_uxn_opcodes_h_l383_c7_7401_cond,
result_stack_address_MUX_uxn_opcodes_h_l383_c7_7401_iftrue,
result_stack_address_MUX_uxn_opcodes_h_l383_c7_7401_iffalse,
result_stack_address_MUX_uxn_opcodes_h_l383_c7_7401_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l385_c26_312e
BIN_OP_MINUS_uxn_opcodes_h_l385_c26_312e : entity work.BIN_OP_MINUS_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l385_c26_312e_left,
BIN_OP_MINUS_uxn_opcodes_h_l385_c26_312e_right,
BIN_OP_MINUS_uxn_opcodes_h_l385_c26_312e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l388_c11_efb3
BIN_OP_EQ_uxn_opcodes_h_l388_c11_efb3 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l388_c11_efb3_left,
BIN_OP_EQ_uxn_opcodes_h_l388_c11_efb3_right,
BIN_OP_EQ_uxn_opcodes_h_l388_c11_efb3_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l388_c7_4091
result_stack_value_MUX_uxn_opcodes_h_l388_c7_4091 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l388_c7_4091_cond,
result_stack_value_MUX_uxn_opcodes_h_l388_c7_4091_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l388_c7_4091_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l388_c7_4091_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4091
result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4091 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4091_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4091_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4091_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4091_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l388_c7_4091
result_is_stack_write_MUX_uxn_opcodes_h_l388_c7_4091 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l388_c7_4091_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l388_c7_4091_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l388_c7_4091_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l388_c7_4091_return_output);

-- result_stack_address_MUX_uxn_opcodes_h_l388_c7_4091
result_stack_address_MUX_uxn_opcodes_h_l388_c7_4091 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_MUX_uxn_opcodes_h_l388_c7_4091_cond,
result_stack_address_MUX_uxn_opcodes_h_l388_c7_4091_iftrue,
result_stack_address_MUX_uxn_opcodes_h_l388_c7_4091_iffalse,
result_stack_address_MUX_uxn_opcodes_h_l388_c7_4091_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l390_c26_a3f0
BIN_OP_MINUS_uxn_opcodes_h_l390_c26_a3f0 : entity work.BIN_OP_MINUS_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l390_c26_a3f0_left,
BIN_OP_MINUS_uxn_opcodes_h_l390_c26_a3f0_right,
BIN_OP_MINUS_uxn_opcodes_h_l390_c26_a3f0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l393_c11_d57d
BIN_OP_EQ_uxn_opcodes_h_l393_c11_d57d : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l393_c11_d57d_left,
BIN_OP_EQ_uxn_opcodes_h_l393_c11_d57d_right,
BIN_OP_EQ_uxn_opcodes_h_l393_c11_d57d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l393_c7_0008
result_stack_value_MUX_uxn_opcodes_h_l393_c7_0008 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l393_c7_0008_cond,
result_stack_value_MUX_uxn_opcodes_h_l393_c7_0008_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l393_c7_0008_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l393_c7_0008_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_0008
result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_0008 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_0008_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_0008_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_0008_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_0008_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_0008
result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_0008 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_0008_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_0008_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_0008_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_0008_return_output);

-- result_stack_address_MUX_uxn_opcodes_h_l393_c7_0008
result_stack_address_MUX_uxn_opcodes_h_l393_c7_0008 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_MUX_uxn_opcodes_h_l393_c7_0008_cond,
result_stack_address_MUX_uxn_opcodes_h_l393_c7_0008_iftrue,
result_stack_address_MUX_uxn_opcodes_h_l393_c7_0008_iffalse,
result_stack_address_MUX_uxn_opcodes_h_l393_c7_0008_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l345_l326_DUPLICATE_4a5d
CONST_SL_8_uint16_t_uxn_opcodes_h_l345_l326_DUPLICATE_4a5d : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l345_l326_DUPLICATE_4a5d_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l345_l326_DUPLICATE_4a5d_return_output);

-- CONST_SR_8_uint16_t_uxn_opcodes_h_l391_l371_DUPLICATE_2205
CONST_SR_8_uint16_t_uxn_opcodes_h_l391_l371_DUPLICATE_2205 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uint16_t_uxn_opcodes_h_l391_l371_DUPLICATE_2205_x,
CONST_SR_8_uint16_t_uxn_opcodes_h_l391_l371_DUPLICATE_2205_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 stack_index,
 ins,
 pc,
 sp,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 t16,
 n16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l313_c6_261d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l313_c1_8a49_return_output,
 n16_MUX_uxn_opcodes_h_l313_c2_a794_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l313_c2_a794_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l313_c2_a794_return_output,
 result_sp_MUX_uxn_opcodes_h_l313_c2_a794_return_output,
 result_stack_address_MUX_uxn_opcodes_h_l313_c2_a794_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l313_c2_a794_return_output,
 result_is_sp_updated_MUX_uxn_opcodes_h_l313_c2_a794_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l313_c2_a794_return_output,
 t16_MUX_uxn_opcodes_h_l313_c2_a794_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l317_c26_de46_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l320_c11_1c23_return_output,
 n16_MUX_uxn_opcodes_h_l320_c7_a123_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l320_c7_a123_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_a123_return_output,
 result_sp_MUX_uxn_opcodes_h_l320_c7_a123_return_output,
 result_stack_address_MUX_uxn_opcodes_h_l320_c7_a123_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_a123_return_output,
 result_is_sp_updated_MUX_uxn_opcodes_h_l320_c7_a123_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_a123_return_output,
 t16_MUX_uxn_opcodes_h_l320_c7_a123_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l322_c26_867b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l324_c11_4057_return_output,
 n16_MUX_uxn_opcodes_h_l324_c7_3000_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l324_c7_3000_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l324_c7_3000_return_output,
 result_sp_MUX_uxn_opcodes_h_l324_c7_3000_return_output,
 result_stack_address_MUX_uxn_opcodes_h_l324_c7_3000_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l324_c7_3000_return_output,
 result_is_sp_updated_MUX_uxn_opcodes_h_l324_c7_3000_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l324_c7_3000_return_output,
 t16_MUX_uxn_opcodes_h_l324_c7_3000_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l328_c26_bd86_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l330_c11_b8d3_return_output,
 n16_MUX_uxn_opcodes_h_l330_c7_b40c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l330_c7_b40c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l330_c7_b40c_return_output,
 result_sp_MUX_uxn_opcodes_h_l330_c7_b40c_return_output,
 result_stack_address_MUX_uxn_opcodes_h_l330_c7_b40c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l330_c7_b40c_return_output,
 result_is_sp_updated_MUX_uxn_opcodes_h_l330_c7_b40c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l330_c7_b40c_return_output,
 t16_MUX_uxn_opcodes_h_l330_c7_b40c_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l332_c26_2ca7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l334_c11_06fd_return_output,
 n16_MUX_uxn_opcodes_h_l334_c7_5e5c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l334_c7_5e5c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l334_c7_5e5c_return_output,
 result_sp_MUX_uxn_opcodes_h_l334_c7_5e5c_return_output,
 result_stack_address_MUX_uxn_opcodes_h_l334_c7_5e5c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l334_c7_5e5c_return_output,
 result_is_sp_updated_MUX_uxn_opcodes_h_l334_c7_5e5c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l334_c7_5e5c_return_output,
 t16_MUX_uxn_opcodes_h_l334_c7_5e5c_return_output,
 BIN_OP_OR_uxn_opcodes_h_l335_c3_61b6_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l337_c26_03a2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l339_c11_5fee_return_output,
 n16_MUX_uxn_opcodes_h_l339_c7_6b80_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l339_c7_6b80_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_6b80_return_output,
 result_sp_MUX_uxn_opcodes_h_l339_c7_6b80_return_output,
 result_stack_address_MUX_uxn_opcodes_h_l339_c7_6b80_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_6b80_return_output,
 result_is_sp_updated_MUX_uxn_opcodes_h_l339_c7_6b80_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_6b80_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l341_c26_14cd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l343_c11_bae3_return_output,
 n16_MUX_uxn_opcodes_h_l343_c7_e415_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l343_c7_e415_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_e415_return_output,
 result_sp_MUX_uxn_opcodes_h_l343_c7_e415_return_output,
 result_stack_address_MUX_uxn_opcodes_h_l343_c7_e415_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_e415_return_output,
 result_is_sp_updated_MUX_uxn_opcodes_h_l343_c7_e415_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_e415_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l347_c26_5bef_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l349_c11_f6c4_return_output,
 n16_MUX_uxn_opcodes_h_l349_c7_6611_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l349_c7_6611_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_6611_return_output,
 result_sp_MUX_uxn_opcodes_h_l349_c7_6611_return_output,
 result_stack_address_MUX_uxn_opcodes_h_l349_c7_6611_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l349_c7_6611_return_output,
 result_is_sp_updated_MUX_uxn_opcodes_h_l349_c7_6611_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_6611_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l351_c26_9c30_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l353_c11_e984_return_output,
 n16_MUX_uxn_opcodes_h_l353_c7_be86_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l353_c7_be86_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_be86_return_output,
 result_sp_MUX_uxn_opcodes_h_l353_c7_be86_return_output,
 result_stack_address_MUX_uxn_opcodes_h_l353_c7_be86_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l353_c7_be86_return_output,
 result_is_sp_updated_MUX_uxn_opcodes_h_l353_c7_be86_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_be86_return_output,
 BIN_OP_OR_uxn_opcodes_h_l354_c3_8140_return_output,
 BIN_OP_AND_uxn_opcodes_h_l358_c16_465e_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l358_c30_51f3_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l358_c39_f347_return_output,
 MUX_uxn_opcodes_h_l358_c16_17d6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l360_c11_8df0_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l360_c7_d038_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_d038_return_output,
 result_sp_MUX_uxn_opcodes_h_l360_c7_d038_return_output,
 result_stack_address_MUX_uxn_opcodes_h_l360_c7_d038_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l360_c7_d038_return_output,
 result_is_sp_updated_MUX_uxn_opcodes_h_l360_c7_d038_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_d038_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l365_c26_d6d9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l368_c11_d9e2_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l368_c7_aa75_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_aa75_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_aa75_return_output,
 result_stack_address_MUX_uxn_opcodes_h_l368_c7_aa75_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l370_c26_3039_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l373_c11_7fc6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l373_c7_2ca9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_2ca9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_2ca9_return_output,
 result_stack_address_MUX_uxn_opcodes_h_l373_c7_2ca9_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l375_c26_1610_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l378_c11_c48e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l378_c7_0826_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_0826_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_0826_return_output,
 result_stack_address_MUX_uxn_opcodes_h_l378_c7_0826_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l380_c26_3d9b_return_output,
 CONST_SR_8_uxn_opcodes_h_l381_c34_f704_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l383_c11_ac62_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l383_c7_7401_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l383_c7_7401_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l383_c7_7401_return_output,
 result_stack_address_MUX_uxn_opcodes_h_l383_c7_7401_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l385_c26_312e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l388_c11_efb3_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l388_c7_4091_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4091_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l388_c7_4091_return_output,
 result_stack_address_MUX_uxn_opcodes_h_l388_c7_4091_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l390_c26_a3f0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l393_c11_d57d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l393_c7_0008_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_0008_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_0008_return_output,
 result_stack_address_MUX_uxn_opcodes_h_l393_c7_0008_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l345_l326_DUPLICATE_4a5d_return_output,
 CONST_SR_8_uint16_t_uxn_opcodes_h_l391_l371_DUPLICATE_2205_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_sp : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l313_c6_261d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l313_c6_261d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l313_c6_261d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l313_c1_8a49_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l313_c1_8a49_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l313_c1_8a49_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l313_c1_8a49_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l313_c2_a794_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l313_c2_a794_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l320_c7_a123_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l313_c2_a794_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l313_c2_a794_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l313_c2_a794_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l313_c2_a794_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l320_c7_a123_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l313_c2_a794_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l313_c2_a794_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l313_c2_a794_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l313_c2_a794_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_a123_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l313_c2_a794_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l313_c2_a794_cond : unsigned(0 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l313_c2_a794_iftrue : unsigned(7 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l313_c2_a794_iffalse : unsigned(7 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l320_c7_a123_return_output : unsigned(7 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l313_c2_a794_return_output : unsigned(7 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l313_c2_a794_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l313_c2_a794_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l313_c2_a794_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l320_c7_a123_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l313_c2_a794_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l313_c2_a794_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l313_c2_a794_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l313_c2_a794_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_a123_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l313_c2_a794_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l313_c2_a794_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l313_c2_a794_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l313_c2_a794_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l320_c7_a123_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l313_c2_a794_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l313_c2_a794_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l313_c2_a794_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l313_c2_a794_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_a123_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l313_c2_a794_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l313_c2_a794_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l313_c2_a794_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l313_c2_a794_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l320_c7_a123_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l313_c2_a794_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l313_c2_a794_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l314_c3_9541_uxn_opcodes_h_l314_c3_9541_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l317_c26_de46_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l317_c26_de46_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l317_c26_de46_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l320_c11_1c23_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l320_c11_1c23_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l320_c11_1c23_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l320_c7_a123_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l320_c7_a123_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l324_c7_3000_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l320_c7_a123_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l320_c7_a123_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l320_c7_a123_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l324_c7_3000_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l320_c7_a123_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_a123_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_a123_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l324_c7_3000_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_a123_cond : unsigned(0 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l320_c7_a123_iftrue : unsigned(7 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l320_c7_a123_iffalse : unsigned(7 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l324_c7_3000_return_output : unsigned(7 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l320_c7_a123_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l320_c7_a123_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l320_c7_a123_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l324_c7_3000_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l320_c7_a123_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_a123_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_a123_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l324_c7_3000_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_a123_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l320_c7_a123_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l320_c7_a123_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l324_c7_3000_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l320_c7_a123_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_a123_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_a123_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l324_c7_3000_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_a123_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l320_c7_a123_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l320_c7_a123_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l324_c7_3000_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l320_c7_a123_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l322_c26_867b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l322_c26_867b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l322_c26_867b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l324_c11_4057_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l324_c11_4057_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l324_c11_4057_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l324_c7_3000_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l324_c7_3000_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l330_c7_b40c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l324_c7_3000_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l324_c7_3000_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l324_c7_3000_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l330_c7_b40c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l324_c7_3000_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l324_c7_3000_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l324_c7_3000_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l330_c7_b40c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l324_c7_3000_cond : unsigned(0 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l324_c7_3000_iftrue : unsigned(7 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l324_c7_3000_iffalse : unsigned(7 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l330_c7_b40c_return_output : unsigned(7 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l324_c7_3000_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l324_c7_3000_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l324_c7_3000_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l330_c7_b40c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l324_c7_3000_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l324_c7_3000_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l324_c7_3000_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l330_c7_b40c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l324_c7_3000_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l324_c7_3000_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l324_c7_3000_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l330_c7_b40c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l324_c7_3000_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l324_c7_3000_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l324_c7_3000_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l330_c7_b40c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l324_c7_3000_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l324_c7_3000_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l324_c7_3000_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l330_c7_b40c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l324_c7_3000_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l328_c26_bd86_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l328_c26_bd86_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l328_c26_bd86_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c11_b8d3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c11_b8d3_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c11_b8d3_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l330_c7_b40c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l330_c7_b40c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l334_c7_5e5c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l330_c7_b40c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l330_c7_b40c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l330_c7_b40c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l334_c7_5e5c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l330_c7_b40c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l330_c7_b40c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l330_c7_b40c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l334_c7_5e5c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l330_c7_b40c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l330_c7_b40c_iftrue : unsigned(7 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l330_c7_b40c_iffalse : unsigned(7 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l334_c7_5e5c_return_output : unsigned(7 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l330_c7_b40c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l330_c7_b40c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l330_c7_b40c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l334_c7_5e5c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l330_c7_b40c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l330_c7_b40c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l330_c7_b40c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l334_c7_5e5c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l330_c7_b40c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l330_c7_b40c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l330_c7_b40c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l334_c7_5e5c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l330_c7_b40c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l330_c7_b40c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l330_c7_b40c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l334_c7_5e5c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l330_c7_b40c_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l330_c7_b40c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l330_c7_b40c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l334_c7_5e5c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l330_c7_b40c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l332_c26_2ca7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l332_c26_2ca7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l332_c26_2ca7_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l334_c11_06fd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l334_c11_06fd_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l334_c11_06fd_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l334_c7_5e5c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l334_c7_5e5c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l339_c7_6b80_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l334_c7_5e5c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l334_c7_5e5c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l334_c7_5e5c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l339_c7_6b80_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l334_c7_5e5c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l334_c7_5e5c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l334_c7_5e5c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_6b80_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l334_c7_5e5c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l334_c7_5e5c_iftrue : unsigned(7 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l334_c7_5e5c_iffalse : unsigned(7 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l339_c7_6b80_return_output : unsigned(7 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l334_c7_5e5c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l334_c7_5e5c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l334_c7_5e5c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l339_c7_6b80_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l334_c7_5e5c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l334_c7_5e5c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l334_c7_5e5c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_6b80_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l334_c7_5e5c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l334_c7_5e5c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l334_c7_5e5c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l339_c7_6b80_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l334_c7_5e5c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l334_c7_5e5c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l334_c7_5e5c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_6b80_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l334_c7_5e5c_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l334_c7_5e5c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l334_c7_5e5c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l334_c7_5e5c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l335_c3_61b6_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l335_c3_61b6_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l335_c3_61b6_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l337_c26_03a2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l337_c26_03a2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l337_c26_03a2_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c11_5fee_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c11_5fee_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c11_5fee_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l339_c7_6b80_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l339_c7_6b80_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l343_c7_e415_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l339_c7_6b80_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l339_c7_6b80_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l339_c7_6b80_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l343_c7_e415_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l339_c7_6b80_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_6b80_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_6b80_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_e415_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_6b80_cond : unsigned(0 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l339_c7_6b80_iftrue : unsigned(7 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l339_c7_6b80_iffalse : unsigned(7 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l343_c7_e415_return_output : unsigned(7 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l339_c7_6b80_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l339_c7_6b80_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l339_c7_6b80_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l343_c7_e415_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l339_c7_6b80_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_6b80_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_6b80_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_e415_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_6b80_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l339_c7_6b80_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l339_c7_6b80_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l343_c7_e415_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l339_c7_6b80_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_6b80_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_6b80_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_e415_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_6b80_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l341_c26_14cd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l341_c26_14cd_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l341_c26_14cd_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l343_c11_bae3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l343_c11_bae3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l343_c11_bae3_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l343_c7_e415_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l343_c7_e415_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l349_c7_6611_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l343_c7_e415_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l343_c7_e415_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l343_c7_e415_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l349_c7_6611_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l343_c7_e415_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_e415_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_e415_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_6611_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_e415_cond : unsigned(0 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l343_c7_e415_iftrue : unsigned(7 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l343_c7_e415_iffalse : unsigned(7 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l349_c7_6611_return_output : unsigned(7 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l343_c7_e415_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l343_c7_e415_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l343_c7_e415_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l349_c7_6611_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l343_c7_e415_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_e415_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_e415_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l349_c7_6611_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_e415_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l343_c7_e415_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l343_c7_e415_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l349_c7_6611_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l343_c7_e415_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_e415_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_e415_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_6611_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_e415_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l347_c26_5bef_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l347_c26_5bef_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l347_c26_5bef_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l349_c11_f6c4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l349_c11_f6c4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l349_c11_f6c4_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l349_c7_6611_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l349_c7_6611_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l353_c7_be86_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l349_c7_6611_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l349_c7_6611_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l349_c7_6611_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l353_c7_be86_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l349_c7_6611_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_6611_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_6611_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_be86_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_6611_cond : unsigned(0 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l349_c7_6611_iftrue : unsigned(7 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l349_c7_6611_iffalse : unsigned(7 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l353_c7_be86_return_output : unsigned(7 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l349_c7_6611_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l349_c7_6611_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l349_c7_6611_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l353_c7_be86_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l349_c7_6611_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l349_c7_6611_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l349_c7_6611_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l353_c7_be86_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l349_c7_6611_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l349_c7_6611_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l349_c7_6611_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l353_c7_be86_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l349_c7_6611_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_6611_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_6611_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_be86_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_6611_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l351_c26_9c30_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l351_c26_9c30_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l351_c26_9c30_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_e984_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_e984_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_e984_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l353_c7_be86_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l353_c7_be86_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l353_c7_be86_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l353_c7_be86_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l353_c7_be86_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l360_c7_d038_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l353_c7_be86_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_be86_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_be86_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_d038_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_be86_cond : unsigned(0 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l353_c7_be86_iftrue : unsigned(7 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l353_c7_be86_iffalse : unsigned(7 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l360_c7_d038_return_output : unsigned(7 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l353_c7_be86_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l353_c7_be86_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_uxn_opcodes_h_l356_c3_2530 : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l353_c7_be86_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l360_c7_d038_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l353_c7_be86_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l353_c7_be86_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l353_c7_be86_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l360_c7_d038_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l353_c7_be86_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l353_c7_be86_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l353_c7_be86_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l360_c7_d038_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l353_c7_be86_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_be86_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_be86_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_d038_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_be86_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l354_c3_8140_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l354_c3_8140_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l354_c3_8140_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l358_c16_17d6_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l358_c16_17d6_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l358_c16_17d6_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l358_c16_465e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l358_c16_465e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l358_c16_465e_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l358_c30_51f3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l358_c30_51f3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l358_c30_51f3_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l358_c39_f347_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l358_c39_f347_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l358_c39_f347_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l358_c16_17d6_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l360_c11_8df0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l360_c11_8df0_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l360_c11_8df0_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l360_c7_d038_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l360_c7_d038_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l368_c7_aa75_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l360_c7_d038_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_d038_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_d038_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_aa75_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_d038_cond : unsigned(0 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l360_c7_d038_iftrue : unsigned(7 downto 0);
 variable VAR_result_sp_uxn_opcodes_h_l362_c3_e5c7 : unsigned(7 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l360_c7_d038_iffalse : unsigned(7 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l360_c7_d038_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l360_c7_d038_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l360_c7_d038_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l368_c7_aa75_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l360_c7_d038_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l360_c7_d038_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l360_c7_d038_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l360_c7_d038_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l360_c7_d038_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l360_c7_d038_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l360_c7_d038_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l360_c7_d038_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_d038_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_d038_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_aa75_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_d038_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l365_c26_d6d9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l365_c26_d6d9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l365_c26_d6d9_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_d9e2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_d9e2_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_d9e2_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l368_c7_aa75_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l368_c7_aa75_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l373_c7_2ca9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l368_c7_aa75_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_aa75_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_aa75_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_2ca9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_aa75_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_aa75_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_aa75_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_2ca9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_aa75_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l368_c7_aa75_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l368_c7_aa75_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l373_c7_2ca9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l368_c7_aa75_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l370_c26_3039_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l370_c26_3039_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l370_c26_3039_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l373_c11_7fc6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l373_c11_7fc6_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l373_c11_7fc6_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l373_c7_2ca9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l373_c7_2ca9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l378_c7_0826_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l373_c7_2ca9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_2ca9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_2ca9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_0826_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_2ca9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_2ca9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_2ca9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_0826_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_2ca9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l373_c7_2ca9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l373_c7_2ca9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l378_c7_0826_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l373_c7_2ca9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l375_c26_1610_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l375_c26_1610_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l375_c26_1610_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l376_c24_3b1f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c11_c48e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c11_c48e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c11_c48e_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l378_c7_0826_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l378_c7_0826_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l383_c7_7401_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l378_c7_0826_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_0826_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_0826_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l383_c7_7401_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_0826_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_0826_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_0826_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l383_c7_7401_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_0826_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l378_c7_0826_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l378_c7_0826_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l383_c7_7401_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l378_c7_0826_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l380_c26_3d9b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l380_c26_3d9b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l380_c26_3d9b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l381_c34_f704_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l381_c34_f704_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l381_c24_0b20_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l383_c11_ac62_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l383_c11_ac62_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l383_c11_ac62_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l383_c7_7401_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l383_c7_7401_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l388_c7_4091_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l383_c7_7401_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l383_c7_7401_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l383_c7_7401_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4091_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l383_c7_7401_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l383_c7_7401_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l383_c7_7401_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l388_c7_4091_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l383_c7_7401_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l383_c7_7401_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l383_c7_7401_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l388_c7_4091_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l383_c7_7401_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l385_c26_312e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l385_c26_312e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l385_c26_312e_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_efb3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_efb3_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_efb3_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l388_c7_4091_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l388_c7_4091_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l393_c7_0008_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l388_c7_4091_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4091_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4091_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_0008_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4091_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l388_c7_4091_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l388_c7_4091_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_0008_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l388_c7_4091_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l388_c7_4091_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l388_c7_4091_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l393_c7_0008_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l388_c7_4091_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l390_c26_a3f0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l390_c26_a3f0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l390_c26_a3f0_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l393_c11_d57d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l393_c11_d57d_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l393_c11_d57d_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l393_c7_0008_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_uxn_opcodes_h_l396_c3_da8b : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l393_c7_0008_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l393_c7_0008_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_0008_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_0008_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_0008_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_0008_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_0008_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_0008_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l393_c7_0008_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_uxn_opcodes_h_l395_c3_6939 : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l393_c7_0008_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_d41d_uxn_opcodes_h_l393_c7_0008_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l393_c7_0008_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l349_l313_l343_l339_l334_l330_l393_l324_l353_l320_DUPLICATE_7542_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_sp_d41d_uxn_opcodes_h_l349_l313_l343_l339_l334_l330_l360_l324_l320_DUPLICATE_4039_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_updated_d41d_uxn_opcodes_h_l349_l313_l343_l339_l334_l330_l360_l324_l320_DUPLICATE_4758_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l349_l383_l343_l378_l339_l373_l334_l368_l330_l360_l393_l324_l353_l388_l320_DUPLICATE_0b9b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l349_l343_l339_l334_l330_l393_l324_l353_l320_DUPLICATE_e4c9_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l344_l335_l325_l354_DUPLICATE_25cf_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l345_l326_DUPLICATE_4a5d_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l345_l326_DUPLICATE_4a5d_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l366_l386_DUPLICATE_ad4e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l391_l371_DUPLICATE_2205_x : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l391_l371_DUPLICATE_2205_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l391_l371_DUPLICATE_5ccd_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a3be_uxn_opcodes_h_l309_l400_DUPLICATE_8679_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_d9e2_right := to_unsigned(10, 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_0008_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_uxn_opcodes_h_l356_c3_2530 := resize(to_unsigned(0, 1), 8);
     VAR_result_stack_address_MUX_uxn_opcodes_h_l353_c7_be86_iftrue := VAR_result_stack_address_uxn_opcodes_h_l356_c3_2530;
     VAR_result_stack_value_uxn_opcodes_h_l396_c3_da8b := resize(to_unsigned(0, 1), 8);
     VAR_result_stack_value_MUX_uxn_opcodes_h_l393_c7_0008_iftrue := VAR_result_stack_value_uxn_opcodes_h_l396_c3_da8b;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l375_c26_1610_right := to_unsigned(3, 2);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_e415_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l373_c11_7fc6_right := to_unsigned(11, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l313_c1_8a49_iffalse := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l330_c7_b40c_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_e984_right := to_unsigned(8, 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_d038_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c11_5fee_right := to_unsigned(5, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l313_c2_a794_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l383_c7_7401_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l313_c6_261d_right := to_unsigned(0, 1);
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l328_c26_bd86_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l313_c2_a794_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l334_c11_06fd_right := to_unsigned(4, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_a123_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l349_c7_6611_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l360_c7_d038_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l360_c11_8df0_right := to_unsigned(9, 4);
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l347_c26_5bef_right := to_unsigned(3, 2);
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l353_c7_be86_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l337_c26_03a2_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c11_b8d3_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c11_c48e_right := to_unsigned(12, 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_aa75_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l370_c26_3039_right := to_unsigned(2, 2);
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l385_c26_312e_right := to_unsigned(5, 3);
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l351_c26_9c30_right := to_unsigned(3, 2);
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l317_c26_de46_right := to_unsigned(2, 2);
     VAR_BIN_OP_AND_uxn_opcodes_h_l358_c16_465e_right := to_unsigned(128, 8);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l313_c2_a794_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l332_c26_2ca7_right := to_unsigned(1, 1);
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l380_c26_3d9b_right := to_unsigned(4, 3);
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l322_c26_867b_right := to_unsigned(2, 2);
     VAR_result_stack_address_uxn_opcodes_h_l395_c3_6939 := resize(to_unsigned(0, 1), 8);
     VAR_result_stack_address_MUX_uxn_opcodes_h_l393_c7_0008_iftrue := VAR_result_stack_address_uxn_opcodes_h_l395_c3_6939;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l358_c39_f347_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l343_c11_bae3_right := to_unsigned(6, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_2ca9_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_0826_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_0008_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l393_c11_d57d_right := to_unsigned(15, 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l388_c7_4091_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l334_c7_5e5c_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l383_c11_ac62_right := to_unsigned(13, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l324_c11_4057_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l320_c11_1c23_right := to_unsigned(1, 1);
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l341_c26_14cd_right := to_unsigned(4, 3);
     VAR_result_sp_uxn_opcodes_h_l362_c3_e5c7 := resize(to_unsigned(0, 1), 8);
     VAR_result_sp_MUX_uxn_opcodes_h_l360_c7_d038_iftrue := VAR_result_sp_uxn_opcodes_h_l362_c3_e5c7;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l358_c30_51f3_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_efb3_right := to_unsigned(14, 4);
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l390_c26_a3f0_right := to_unsigned(6, 3);
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l365_c26_d6d9_right := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l324_c7_3000_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l349_c11_f6c4_right := to_unsigned(7, 3);
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l360_c7_d038_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l353_c7_be86_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_6b80_iftrue := to_unsigned(1, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_stack_index := stack_index;
     VAR_ins := ins;
     VAR_pc := pc;
     VAR_sp := sp;
     VAR_previous_stack_read := previous_stack_read;
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l313_c1_8a49_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l358_c16_465e_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l354_c3_8140_left := n16;
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l391_l371_DUPLICATE_2205_x := n16;
     VAR_n16_MUX_uxn_opcodes_h_l313_c2_a794_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l320_c7_a123_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l324_c7_3000_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l330_c7_b40c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l334_c7_5e5c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l339_c7_6b80_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l349_c7_6611_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l353_c7_be86_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l313_c6_261d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l320_c11_1c23_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l324_c11_4057_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c11_b8d3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l334_c11_06fd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c11_5fee_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l343_c11_bae3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l349_c11_f6c4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_e984_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l360_c11_8df0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_d9e2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l373_c11_7fc6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c11_c48e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l383_c11_ac62_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_efb3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l393_c11_d57d_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l317_c26_de46_left := VAR_sp;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l322_c26_867b_left := VAR_sp;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l328_c26_bd86_left := VAR_sp;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l332_c26_2ca7_left := VAR_sp;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l337_c26_03a2_left := VAR_sp;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l341_c26_14cd_left := VAR_sp;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l347_c26_5bef_left := VAR_sp;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l351_c26_9c30_left := VAR_sp;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l365_c26_d6d9_left := VAR_sp;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l370_c26_3039_left := VAR_sp;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l375_c26_1610_left := VAR_sp;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l380_c26_3d9b_left := VAR_sp;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l385_c26_312e_left := VAR_sp;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l390_c26_a3f0_left := VAR_sp;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l358_c30_51f3_left := VAR_sp;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l358_c39_f347_left := VAR_sp;
     VAR_BIN_OP_OR_uxn_opcodes_h_l335_c3_61b6_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l381_c34_f704_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l313_c2_a794_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l320_c7_a123_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l330_c7_b40c_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l334_c7_5e5c_iffalse := t16;
     -- CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l366_l386_DUPLICATE_ad4e LATENCY=0
     VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l366_l386_DUPLICATE_ad4e_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- BIN_OP_AND[uxn_opcodes_h_l358_c16_465e] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l358_c16_465e_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l358_c16_465e_left;
     BIN_OP_AND_uxn_opcodes_h_l358_c16_465e_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l358_c16_465e_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l358_c16_465e_return_output := BIN_OP_AND_uxn_opcodes_h_l358_c16_465e_return_output;

     -- result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d[uxn_opcodes_h_l360_c7_d038] LATENCY=0
     VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l360_c7_d038_return_output := result.is_stack_read;

     -- BIN_OP_MINUS[uxn_opcodes_h_l341_c26_14cd] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l341_c26_14cd_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l341_c26_14cd_left;
     BIN_OP_MINUS_uxn_opcodes_h_l341_c26_14cd_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l341_c26_14cd_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l341_c26_14cd_return_output := BIN_OP_MINUS_uxn_opcodes_h_l341_c26_14cd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l313_c6_261d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l313_c6_261d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l313_c6_261d_left;
     BIN_OP_EQ_uxn_opcodes_h_l313_c6_261d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l313_c6_261d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l313_c6_261d_return_output := BIN_OP_EQ_uxn_opcodes_h_l313_c6_261d_return_output;

     -- BIN_OP_MINUS[uxn_opcodes_h_l322_c26_867b] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l322_c26_867b_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l322_c26_867b_left;
     BIN_OP_MINUS_uxn_opcodes_h_l322_c26_867b_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l322_c26_867b_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l322_c26_867b_return_output := BIN_OP_MINUS_uxn_opcodes_h_l322_c26_867b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l368_c11_d9e2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l368_c11_d9e2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_d9e2_left;
     BIN_OP_EQ_uxn_opcodes_h_l368_c11_d9e2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_d9e2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_d9e2_return_output := BIN_OP_EQ_uxn_opcodes_h_l368_c11_d9e2_return_output;

     -- BIN_OP_MINUS[uxn_opcodes_h_l390_c26_a3f0] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l390_c26_a3f0_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l390_c26_a3f0_left;
     BIN_OP_MINUS_uxn_opcodes_h_l390_c26_a3f0_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l390_c26_a3f0_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l390_c26_a3f0_return_output := BIN_OP_MINUS_uxn_opcodes_h_l390_c26_a3f0_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l349_l383_l343_l378_l339_l373_l334_l368_l330_l360_l393_l324_l353_l388_l320_DUPLICATE_0b9b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l349_l383_l343_l378_l339_l373_l334_l368_l330_l360_l393_l324_l353_l388_l320_DUPLICATE_0b9b_return_output := result.is_opc_done;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l376_c24_3b1f] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l376_c24_3b1f_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- BIN_OP_MINUS[uxn_opcodes_h_l351_c26_9c30] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l351_c26_9c30_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l351_c26_9c30_left;
     BIN_OP_MINUS_uxn_opcodes_h_l351_c26_9c30_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l351_c26_9c30_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l351_c26_9c30_return_output := BIN_OP_MINUS_uxn_opcodes_h_l351_c26_9c30_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l334_c11_06fd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l334_c11_06fd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l334_c11_06fd_left;
     BIN_OP_EQ_uxn_opcodes_h_l334_c11_06fd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l334_c11_06fd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l334_c11_06fd_return_output := BIN_OP_EQ_uxn_opcodes_h_l334_c11_06fd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l349_c11_f6c4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l349_c11_f6c4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l349_c11_f6c4_left;
     BIN_OP_EQ_uxn_opcodes_h_l349_c11_f6c4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l349_c11_f6c4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l349_c11_f6c4_return_output := BIN_OP_EQ_uxn_opcodes_h_l349_c11_f6c4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l378_c11_c48e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l378_c11_c48e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c11_c48e_left;
     BIN_OP_EQ_uxn_opcodes_h_l378_c11_c48e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c11_c48e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c11_c48e_return_output := BIN_OP_EQ_uxn_opcodes_h_l378_c11_c48e_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_updated_d41d_uxn_opcodes_h_l349_l313_l343_l339_l334_l330_l360_l324_l320_DUPLICATE_4758 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_updated_d41d_uxn_opcodes_h_l349_l313_l343_l339_l334_l330_l360_l324_l320_DUPLICATE_4758_return_output := result.is_sp_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l320_c11_1c23] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l320_c11_1c23_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l320_c11_1c23_left;
     BIN_OP_EQ_uxn_opcodes_h_l320_c11_1c23_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l320_c11_1c23_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l320_c11_1c23_return_output := BIN_OP_EQ_uxn_opcodes_h_l320_c11_1c23_return_output;

     -- result_stack_address_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_d41d[uxn_opcodes_h_l393_c7_0008] LATENCY=0
     VAR_result_stack_address_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_d41d_uxn_opcodes_h_l393_c7_0008_return_output := result.stack_address;

     -- BIN_OP_MINUS[uxn_opcodes_h_l365_c26_d6d9] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l365_c26_d6d9_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l365_c26_d6d9_left;
     BIN_OP_MINUS_uxn_opcodes_h_l365_c26_d6d9_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l365_c26_d6d9_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l365_c26_d6d9_return_output := BIN_OP_MINUS_uxn_opcodes_h_l365_c26_d6d9_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l349_l343_l339_l334_l330_l393_l324_l353_l320_DUPLICATE_e4c9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l349_l343_l339_l334_l330_l393_l324_l353_l320_DUPLICATE_e4c9_return_output := result.is_stack_write;

     -- BIN_OP_MINUS[uxn_opcodes_h_l317_c26_de46] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l317_c26_de46_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l317_c26_de46_left;
     BIN_OP_MINUS_uxn_opcodes_h_l317_c26_de46_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l317_c26_de46_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l317_c26_de46_return_output := BIN_OP_MINUS_uxn_opcodes_h_l317_c26_de46_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l344_l335_l325_l354_DUPLICATE_25cf LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l344_l335_l325_l354_DUPLICATE_25cf_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_SR_8[uxn_opcodes_h_l381_c34_f704] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l381_c34_f704_x <= VAR_CONST_SR_8_uxn_opcodes_h_l381_c34_f704_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l381_c34_f704_return_output := CONST_SR_8_uxn_opcodes_h_l381_c34_f704_return_output;

     -- BIN_OP_MINUS[uxn_opcodes_h_l370_c26_3039] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l370_c26_3039_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l370_c26_3039_left;
     BIN_OP_MINUS_uxn_opcodes_h_l370_c26_3039_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l370_c26_3039_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l370_c26_3039_return_output := BIN_OP_MINUS_uxn_opcodes_h_l370_c26_3039_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_sp_d41d_uxn_opcodes_h_l349_l313_l343_l339_l334_l330_l360_l324_l320_DUPLICATE_4039 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_sp_d41d_uxn_opcodes_h_l349_l313_l343_l339_l334_l330_l360_l324_l320_DUPLICATE_4039_return_output := result.sp;

     -- BIN_OP_MINUS[uxn_opcodes_h_l332_c26_2ca7] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l332_c26_2ca7_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l332_c26_2ca7_left;
     BIN_OP_MINUS_uxn_opcodes_h_l332_c26_2ca7_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l332_c26_2ca7_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l332_c26_2ca7_return_output := BIN_OP_MINUS_uxn_opcodes_h_l332_c26_2ca7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l343_c11_bae3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l343_c11_bae3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l343_c11_bae3_left;
     BIN_OP_EQ_uxn_opcodes_h_l343_c11_bae3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l343_c11_bae3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l343_c11_bae3_return_output := BIN_OP_EQ_uxn_opcodes_h_l343_c11_bae3_return_output;

     -- BIN_OP_MINUS[uxn_opcodes_h_l328_c26_bd86] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l328_c26_bd86_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l328_c26_bd86_left;
     BIN_OP_MINUS_uxn_opcodes_h_l328_c26_bd86_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l328_c26_bd86_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l328_c26_bd86_return_output := BIN_OP_MINUS_uxn_opcodes_h_l328_c26_bd86_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l353_c11_e984] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l353_c11_e984_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_e984_left;
     BIN_OP_EQ_uxn_opcodes_h_l353_c11_e984_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_e984_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_e984_return_output := BIN_OP_EQ_uxn_opcodes_h_l353_c11_e984_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l339_c11_5fee] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l339_c11_5fee_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c11_5fee_left;
     BIN_OP_EQ_uxn_opcodes_h_l339_c11_5fee_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c11_5fee_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c11_5fee_return_output := BIN_OP_EQ_uxn_opcodes_h_l339_c11_5fee_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l388_c11_efb3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l388_c11_efb3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_efb3_left;
     BIN_OP_EQ_uxn_opcodes_h_l388_c11_efb3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_efb3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_efb3_return_output := BIN_OP_EQ_uxn_opcodes_h_l388_c11_efb3_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l358_c30_51f3] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l358_c30_51f3_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l358_c30_51f3_left;
     BIN_OP_PLUS_uxn_opcodes_h_l358_c30_51f3_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l358_c30_51f3_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l358_c30_51f3_return_output := BIN_OP_PLUS_uxn_opcodes_h_l358_c30_51f3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l373_c11_7fc6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l373_c11_7fc6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l373_c11_7fc6_left;
     BIN_OP_EQ_uxn_opcodes_h_l373_c11_7fc6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l373_c11_7fc6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l373_c11_7fc6_return_output := BIN_OP_EQ_uxn_opcodes_h_l373_c11_7fc6_return_output;

     -- BIN_OP_MINUS[uxn_opcodes_h_l385_c26_312e] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l385_c26_312e_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l385_c26_312e_left;
     BIN_OP_MINUS_uxn_opcodes_h_l385_c26_312e_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l385_c26_312e_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l385_c26_312e_return_output := BIN_OP_MINUS_uxn_opcodes_h_l385_c26_312e_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l349_l313_l343_l339_l334_l330_l393_l324_l353_l320_DUPLICATE_7542 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l349_l313_l343_l339_l334_l330_l393_l324_l353_l320_DUPLICATE_7542_return_output := result.stack_value;

     -- BIN_OP_PLUS[uxn_opcodes_h_l358_c39_f347] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l358_c39_f347_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l358_c39_f347_left;
     BIN_OP_PLUS_uxn_opcodes_h_l358_c39_f347_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l358_c39_f347_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l358_c39_f347_return_output := BIN_OP_PLUS_uxn_opcodes_h_l358_c39_f347_return_output;

     -- BIN_OP_MINUS[uxn_opcodes_h_l380_c26_3d9b] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l380_c26_3d9b_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l380_c26_3d9b_left;
     BIN_OP_MINUS_uxn_opcodes_h_l380_c26_3d9b_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l380_c26_3d9b_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l380_c26_3d9b_return_output := BIN_OP_MINUS_uxn_opcodes_h_l380_c26_3d9b_return_output;

     -- CONST_SR_8_uint16_t_uxn_opcodes_h_l391_l371_DUPLICATE_2205 LATENCY=0
     -- Inputs
     CONST_SR_8_uint16_t_uxn_opcodes_h_l391_l371_DUPLICATE_2205_x <= VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l391_l371_DUPLICATE_2205_x;
     -- Outputs
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l391_l371_DUPLICATE_2205_return_output := CONST_SR_8_uint16_t_uxn_opcodes_h_l391_l371_DUPLICATE_2205_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l324_c11_4057] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l324_c11_4057_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l324_c11_4057_left;
     BIN_OP_EQ_uxn_opcodes_h_l324_c11_4057_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l324_c11_4057_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l324_c11_4057_return_output := BIN_OP_EQ_uxn_opcodes_h_l324_c11_4057_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l330_c11_b8d3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l330_c11_b8d3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c11_b8d3_left;
     BIN_OP_EQ_uxn_opcodes_h_l330_c11_b8d3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c11_b8d3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c11_b8d3_return_output := BIN_OP_EQ_uxn_opcodes_h_l330_c11_b8d3_return_output;

     -- BIN_OP_MINUS[uxn_opcodes_h_l337_c26_03a2] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l337_c26_03a2_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l337_c26_03a2_left;
     BIN_OP_MINUS_uxn_opcodes_h_l337_c26_03a2_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l337_c26_03a2_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l337_c26_03a2_return_output := BIN_OP_MINUS_uxn_opcodes_h_l337_c26_03a2_return_output;

     -- BIN_OP_MINUS[uxn_opcodes_h_l347_c26_5bef] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l347_c26_5bef_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l347_c26_5bef_left;
     BIN_OP_MINUS_uxn_opcodes_h_l347_c26_5bef_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l347_c26_5bef_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l347_c26_5bef_return_output := BIN_OP_MINUS_uxn_opcodes_h_l347_c26_5bef_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l383_c11_ac62] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l383_c11_ac62_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l383_c11_ac62_left;
     BIN_OP_EQ_uxn_opcodes_h_l383_c11_ac62_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l383_c11_ac62_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l383_c11_ac62_return_output := BIN_OP_EQ_uxn_opcodes_h_l383_c11_ac62_return_output;

     -- BIN_OP_MINUS[uxn_opcodes_h_l375_c26_1610] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l375_c26_1610_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l375_c26_1610_left;
     BIN_OP_MINUS_uxn_opcodes_h_l375_c26_1610_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l375_c26_1610_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l375_c26_1610_return_output := BIN_OP_MINUS_uxn_opcodes_h_l375_c26_1610_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l360_c11_8df0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l360_c11_8df0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l360_c11_8df0_left;
     BIN_OP_EQ_uxn_opcodes_h_l360_c11_8df0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l360_c11_8df0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l360_c11_8df0_return_output := BIN_OP_EQ_uxn_opcodes_h_l360_c11_8df0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l393_c11_d57d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l393_c11_d57d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l393_c11_d57d_left;
     BIN_OP_EQ_uxn_opcodes_h_l393_c11_d57d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l393_c11_d57d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l393_c11_d57d_return_output := BIN_OP_EQ_uxn_opcodes_h_l393_c11_d57d_return_output;

     -- Submodule level 1
     VAR_MUX_uxn_opcodes_h_l358_c16_17d6_cond := resize(VAR_BIN_OP_AND_uxn_opcodes_h_l358_c16_465e_return_output, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l313_c1_8a49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l313_c6_261d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l313_c2_a794_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l313_c6_261d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l313_c2_a794_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l313_c6_261d_return_output;
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l313_c2_a794_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l313_c6_261d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l313_c2_a794_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l313_c6_261d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l313_c2_a794_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l313_c6_261d_return_output;
     VAR_result_sp_MUX_uxn_opcodes_h_l313_c2_a794_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l313_c6_261d_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l313_c2_a794_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l313_c6_261d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l313_c2_a794_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l313_c6_261d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l313_c2_a794_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l313_c6_261d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l320_c7_a123_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l320_c11_1c23_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_a123_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l320_c11_1c23_return_output;
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l320_c7_a123_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l320_c11_1c23_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_a123_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l320_c11_1c23_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_a123_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l320_c11_1c23_return_output;
     VAR_result_sp_MUX_uxn_opcodes_h_l320_c7_a123_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l320_c11_1c23_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l320_c7_a123_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l320_c11_1c23_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l320_c7_a123_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l320_c11_1c23_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l320_c7_a123_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l320_c11_1c23_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l324_c7_3000_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l324_c11_4057_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l324_c7_3000_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l324_c11_4057_return_output;
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l324_c7_3000_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l324_c11_4057_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l324_c7_3000_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l324_c11_4057_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l324_c7_3000_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l324_c11_4057_return_output;
     VAR_result_sp_MUX_uxn_opcodes_h_l324_c7_3000_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l324_c11_4057_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l324_c7_3000_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l324_c11_4057_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l324_c7_3000_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l324_c11_4057_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l324_c7_3000_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l324_c11_4057_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l330_c7_b40c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c11_b8d3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l330_c7_b40c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c11_b8d3_return_output;
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l330_c7_b40c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c11_b8d3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l330_c7_b40c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c11_b8d3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l330_c7_b40c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c11_b8d3_return_output;
     VAR_result_sp_MUX_uxn_opcodes_h_l330_c7_b40c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c11_b8d3_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l330_c7_b40c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c11_b8d3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l330_c7_b40c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c11_b8d3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l330_c7_b40c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c11_b8d3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l334_c7_5e5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l334_c11_06fd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l334_c7_5e5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l334_c11_06fd_return_output;
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l334_c7_5e5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l334_c11_06fd_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l334_c7_5e5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l334_c11_06fd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l334_c7_5e5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l334_c11_06fd_return_output;
     VAR_result_sp_MUX_uxn_opcodes_h_l334_c7_5e5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l334_c11_06fd_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l334_c7_5e5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l334_c11_06fd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l334_c7_5e5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l334_c11_06fd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l334_c7_5e5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l334_c11_06fd_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l339_c7_6b80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c11_5fee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_6b80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c11_5fee_return_output;
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l339_c7_6b80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c11_5fee_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_6b80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c11_5fee_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_6b80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c11_5fee_return_output;
     VAR_result_sp_MUX_uxn_opcodes_h_l339_c7_6b80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c11_5fee_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l339_c7_6b80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c11_5fee_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l339_c7_6b80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c11_5fee_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l343_c7_e415_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l343_c11_bae3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_e415_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l343_c11_bae3_return_output;
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l343_c7_e415_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l343_c11_bae3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_e415_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l343_c11_bae3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_e415_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l343_c11_bae3_return_output;
     VAR_result_sp_MUX_uxn_opcodes_h_l343_c7_e415_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l343_c11_bae3_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l343_c7_e415_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l343_c11_bae3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l343_c7_e415_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l343_c11_bae3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l349_c7_6611_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l349_c11_f6c4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_6611_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l349_c11_f6c4_return_output;
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l349_c7_6611_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l349_c11_f6c4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l349_c7_6611_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l349_c11_f6c4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_6611_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l349_c11_f6c4_return_output;
     VAR_result_sp_MUX_uxn_opcodes_h_l349_c7_6611_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l349_c11_f6c4_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l349_c7_6611_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l349_c11_f6c4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l349_c7_6611_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l349_c11_f6c4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l353_c7_be86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_e984_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_be86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_e984_return_output;
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l353_c7_be86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_e984_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l353_c7_be86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_e984_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_be86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_e984_return_output;
     VAR_result_sp_MUX_uxn_opcodes_h_l353_c7_be86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_e984_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l353_c7_be86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_e984_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l353_c7_be86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_e984_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_d038_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l360_c11_8df0_return_output;
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l360_c7_d038_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l360_c11_8df0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l360_c7_d038_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l360_c11_8df0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_d038_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l360_c11_8df0_return_output;
     VAR_result_sp_MUX_uxn_opcodes_h_l360_c7_d038_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l360_c11_8df0_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l360_c7_d038_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l360_c11_8df0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l360_c7_d038_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l360_c11_8df0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_aa75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_d9e2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_aa75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_d9e2_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l368_c7_aa75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_d9e2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l368_c7_aa75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_d9e2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_2ca9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l373_c11_7fc6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_2ca9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l373_c11_7fc6_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l373_c7_2ca9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l373_c11_7fc6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l373_c7_2ca9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l373_c11_7fc6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_0826_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c11_c48e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_0826_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c11_c48e_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l378_c7_0826_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c11_c48e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l378_c7_0826_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c11_c48e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l383_c7_7401_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l383_c11_ac62_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l383_c7_7401_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l383_c11_ac62_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l383_c7_7401_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l383_c11_ac62_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l383_c7_7401_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l383_c11_ac62_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4091_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_efb3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l388_c7_4091_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_efb3_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l388_c7_4091_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_efb3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l388_c7_4091_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_efb3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_0008_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l393_c11_d57d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_0008_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l393_c11_d57d_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l393_c7_0008_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l393_c11_d57d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l393_c7_0008_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l393_c11_d57d_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l313_c2_a794_iftrue := VAR_BIN_OP_MINUS_uxn_opcodes_h_l317_c26_de46_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l320_c7_a123_iftrue := VAR_BIN_OP_MINUS_uxn_opcodes_h_l322_c26_867b_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l324_c7_3000_iftrue := VAR_BIN_OP_MINUS_uxn_opcodes_h_l328_c26_bd86_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l330_c7_b40c_iftrue := VAR_BIN_OP_MINUS_uxn_opcodes_h_l332_c26_2ca7_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l334_c7_5e5c_iftrue := VAR_BIN_OP_MINUS_uxn_opcodes_h_l337_c26_03a2_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l339_c7_6b80_iftrue := VAR_BIN_OP_MINUS_uxn_opcodes_h_l341_c26_14cd_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l343_c7_e415_iftrue := VAR_BIN_OP_MINUS_uxn_opcodes_h_l347_c26_5bef_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l349_c7_6611_iftrue := VAR_BIN_OP_MINUS_uxn_opcodes_h_l351_c26_9c30_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l360_c7_d038_iftrue := VAR_BIN_OP_MINUS_uxn_opcodes_h_l365_c26_d6d9_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l368_c7_aa75_iftrue := VAR_BIN_OP_MINUS_uxn_opcodes_h_l370_c26_3039_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l373_c7_2ca9_iftrue := VAR_BIN_OP_MINUS_uxn_opcodes_h_l375_c26_1610_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l378_c7_0826_iftrue := VAR_BIN_OP_MINUS_uxn_opcodes_h_l380_c26_3d9b_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l383_c7_7401_iftrue := VAR_BIN_OP_MINUS_uxn_opcodes_h_l385_c26_312e_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l388_c7_4091_iftrue := VAR_BIN_OP_MINUS_uxn_opcodes_h_l390_c26_a3f0_return_output;
     VAR_MUX_uxn_opcodes_h_l358_c16_17d6_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l358_c30_51f3_return_output, 8);
     VAR_MUX_uxn_opcodes_h_l358_c16_17d6_iffalse := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l358_c39_f347_return_output, 8);
     VAR_BIN_OP_OR_uxn_opcodes_h_l335_c3_61b6_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l344_l335_l325_l354_DUPLICATE_25cf_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l354_c3_8140_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l344_l335_l325_l354_DUPLICATE_25cf_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l345_l326_DUPLICATE_4a5d_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l344_l335_l325_l354_DUPLICATE_25cf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l373_c7_2ca9_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l376_c24_3b1f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l360_c7_d038_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l366_l386_DUPLICATE_ad4e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l383_c7_7401_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l366_l386_DUPLICATE_ad4e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_a123_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l349_l383_l343_l378_l339_l373_l334_l368_l330_l360_l393_l324_l353_l388_l320_DUPLICATE_0b9b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l324_c7_3000_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l349_l383_l343_l378_l339_l373_l334_l368_l330_l360_l393_l324_l353_l388_l320_DUPLICATE_0b9b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l330_c7_b40c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l349_l383_l343_l378_l339_l373_l334_l368_l330_l360_l393_l324_l353_l388_l320_DUPLICATE_0b9b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l334_c7_5e5c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l349_l383_l343_l378_l339_l373_l334_l368_l330_l360_l393_l324_l353_l388_l320_DUPLICATE_0b9b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_6b80_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l349_l383_l343_l378_l339_l373_l334_l368_l330_l360_l393_l324_l353_l388_l320_DUPLICATE_0b9b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_e415_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l349_l383_l343_l378_l339_l373_l334_l368_l330_l360_l393_l324_l353_l388_l320_DUPLICATE_0b9b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_6611_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l349_l383_l343_l378_l339_l373_l334_l368_l330_l360_l393_l324_l353_l388_l320_DUPLICATE_0b9b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_be86_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l349_l383_l343_l378_l339_l373_l334_l368_l330_l360_l393_l324_l353_l388_l320_DUPLICATE_0b9b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_d038_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l349_l383_l343_l378_l339_l373_l334_l368_l330_l360_l393_l324_l353_l388_l320_DUPLICATE_0b9b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_aa75_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l349_l383_l343_l378_l339_l373_l334_l368_l330_l360_l393_l324_l353_l388_l320_DUPLICATE_0b9b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_2ca9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l349_l383_l343_l378_l339_l373_l334_l368_l330_l360_l393_l324_l353_l388_l320_DUPLICATE_0b9b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_0826_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l349_l383_l343_l378_l339_l373_l334_l368_l330_l360_l393_l324_l353_l388_l320_DUPLICATE_0b9b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l383_c7_7401_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l349_l383_l343_l378_l339_l373_l334_l368_l330_l360_l393_l324_l353_l388_l320_DUPLICATE_0b9b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4091_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l349_l383_l343_l378_l339_l373_l334_l368_l330_l360_l393_l324_l353_l388_l320_DUPLICATE_0b9b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_0008_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l349_l383_l343_l378_l339_l373_l334_l368_l330_l360_l393_l324_l353_l388_l320_DUPLICATE_0b9b_return_output;
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l313_c2_a794_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_updated_d41d_uxn_opcodes_h_l349_l313_l343_l339_l334_l330_l360_l324_l320_DUPLICATE_4758_return_output;
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l320_c7_a123_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_updated_d41d_uxn_opcodes_h_l349_l313_l343_l339_l334_l330_l360_l324_l320_DUPLICATE_4758_return_output;
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l324_c7_3000_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_updated_d41d_uxn_opcodes_h_l349_l313_l343_l339_l334_l330_l360_l324_l320_DUPLICATE_4758_return_output;
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l330_c7_b40c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_updated_d41d_uxn_opcodes_h_l349_l313_l343_l339_l334_l330_l360_l324_l320_DUPLICATE_4758_return_output;
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l334_c7_5e5c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_updated_d41d_uxn_opcodes_h_l349_l313_l343_l339_l334_l330_l360_l324_l320_DUPLICATE_4758_return_output;
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l339_c7_6b80_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_updated_d41d_uxn_opcodes_h_l349_l313_l343_l339_l334_l330_l360_l324_l320_DUPLICATE_4758_return_output;
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l343_c7_e415_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_updated_d41d_uxn_opcodes_h_l349_l313_l343_l339_l334_l330_l360_l324_l320_DUPLICATE_4758_return_output;
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l349_c7_6611_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_updated_d41d_uxn_opcodes_h_l349_l313_l343_l339_l334_l330_l360_l324_l320_DUPLICATE_4758_return_output;
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l360_c7_d038_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_updated_d41d_uxn_opcodes_h_l349_l313_l343_l339_l334_l330_l360_l324_l320_DUPLICATE_4758_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_a123_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l349_l343_l339_l334_l330_l393_l324_l353_l320_DUPLICATE_e4c9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l324_c7_3000_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l349_l343_l339_l334_l330_l393_l324_l353_l320_DUPLICATE_e4c9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l330_c7_b40c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l349_l343_l339_l334_l330_l393_l324_l353_l320_DUPLICATE_e4c9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l334_c7_5e5c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l349_l343_l339_l334_l330_l393_l324_l353_l320_DUPLICATE_e4c9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_6b80_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l349_l343_l339_l334_l330_l393_l324_l353_l320_DUPLICATE_e4c9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_e415_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l349_l343_l339_l334_l330_l393_l324_l353_l320_DUPLICATE_e4c9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_6611_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l349_l343_l339_l334_l330_l393_l324_l353_l320_DUPLICATE_e4c9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_be86_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l349_l343_l339_l334_l330_l393_l324_l353_l320_DUPLICATE_e4c9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_0008_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l349_l343_l339_l334_l330_l393_l324_l353_l320_DUPLICATE_e4c9_return_output;
     VAR_result_sp_MUX_uxn_opcodes_h_l313_c2_a794_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_sp_d41d_uxn_opcodes_h_l349_l313_l343_l339_l334_l330_l360_l324_l320_DUPLICATE_4039_return_output;
     VAR_result_sp_MUX_uxn_opcodes_h_l320_c7_a123_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_sp_d41d_uxn_opcodes_h_l349_l313_l343_l339_l334_l330_l360_l324_l320_DUPLICATE_4039_return_output;
     VAR_result_sp_MUX_uxn_opcodes_h_l324_c7_3000_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_sp_d41d_uxn_opcodes_h_l349_l313_l343_l339_l334_l330_l360_l324_l320_DUPLICATE_4039_return_output;
     VAR_result_sp_MUX_uxn_opcodes_h_l330_c7_b40c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_sp_d41d_uxn_opcodes_h_l349_l313_l343_l339_l334_l330_l360_l324_l320_DUPLICATE_4039_return_output;
     VAR_result_sp_MUX_uxn_opcodes_h_l334_c7_5e5c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_sp_d41d_uxn_opcodes_h_l349_l313_l343_l339_l334_l330_l360_l324_l320_DUPLICATE_4039_return_output;
     VAR_result_sp_MUX_uxn_opcodes_h_l339_c7_6b80_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_sp_d41d_uxn_opcodes_h_l349_l313_l343_l339_l334_l330_l360_l324_l320_DUPLICATE_4039_return_output;
     VAR_result_sp_MUX_uxn_opcodes_h_l343_c7_e415_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_sp_d41d_uxn_opcodes_h_l349_l313_l343_l339_l334_l330_l360_l324_l320_DUPLICATE_4039_return_output;
     VAR_result_sp_MUX_uxn_opcodes_h_l349_c7_6611_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_sp_d41d_uxn_opcodes_h_l349_l313_l343_l339_l334_l330_l360_l324_l320_DUPLICATE_4039_return_output;
     VAR_result_sp_MUX_uxn_opcodes_h_l360_c7_d038_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_sp_d41d_uxn_opcodes_h_l349_l313_l343_l339_l334_l330_l360_l324_l320_DUPLICATE_4039_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l313_c2_a794_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l349_l313_l343_l339_l334_l330_l393_l324_l353_l320_DUPLICATE_7542_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l320_c7_a123_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l349_l313_l343_l339_l334_l330_l393_l324_l353_l320_DUPLICATE_7542_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l324_c7_3000_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l349_l313_l343_l339_l334_l330_l393_l324_l353_l320_DUPLICATE_7542_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l330_c7_b40c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l349_l313_l343_l339_l334_l330_l393_l324_l353_l320_DUPLICATE_7542_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l334_c7_5e5c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l349_l313_l343_l339_l334_l330_l393_l324_l353_l320_DUPLICATE_7542_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l339_c7_6b80_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l349_l313_l343_l339_l334_l330_l393_l324_l353_l320_DUPLICATE_7542_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l343_c7_e415_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l349_l313_l343_l339_l334_l330_l393_l324_l353_l320_DUPLICATE_7542_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l349_c7_6611_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l349_l313_l343_l339_l334_l330_l393_l324_l353_l320_DUPLICATE_7542_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l353_c7_be86_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l349_l313_l343_l339_l334_l330_l393_l324_l353_l320_DUPLICATE_7542_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l393_c7_0008_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l349_l313_l343_l339_l334_l330_l393_l324_l353_l320_DUPLICATE_7542_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l360_c7_d038_iffalse := VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l360_c7_d038_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l393_c7_0008_iffalse := VAR_result_stack_address_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_d41d_uxn_opcodes_h_l393_c7_0008_return_output;
     -- result_sp_MUX[uxn_opcodes_h_l360_c7_d038] LATENCY=0
     -- Inputs
     result_sp_MUX_uxn_opcodes_h_l360_c7_d038_cond <= VAR_result_sp_MUX_uxn_opcodes_h_l360_c7_d038_cond;
     result_sp_MUX_uxn_opcodes_h_l360_c7_d038_iftrue <= VAR_result_sp_MUX_uxn_opcodes_h_l360_c7_d038_iftrue;
     result_sp_MUX_uxn_opcodes_h_l360_c7_d038_iffalse <= VAR_result_sp_MUX_uxn_opcodes_h_l360_c7_d038_iffalse;
     -- Outputs
     VAR_result_sp_MUX_uxn_opcodes_h_l360_c7_d038_return_output := result_sp_MUX_uxn_opcodes_h_l360_c7_d038_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l313_c1_8a49] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l313_c1_8a49_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l313_c1_8a49_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l313_c1_8a49_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l313_c1_8a49_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l313_c1_8a49_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l313_c1_8a49_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l313_c1_8a49_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l313_c1_8a49_return_output;

     -- MUX[uxn_opcodes_h_l358_c16_17d6] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l358_c16_17d6_cond <= VAR_MUX_uxn_opcodes_h_l358_c16_17d6_cond;
     MUX_uxn_opcodes_h_l358_c16_17d6_iftrue <= VAR_MUX_uxn_opcodes_h_l358_c16_17d6_iftrue;
     MUX_uxn_opcodes_h_l358_c16_17d6_iffalse <= VAR_MUX_uxn_opcodes_h_l358_c16_17d6_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l358_c16_17d6_return_output := MUX_uxn_opcodes_h_l358_c16_17d6_return_output;

     -- result_is_sp_updated_MUX[uxn_opcodes_h_l360_c7_d038] LATENCY=0
     -- Inputs
     result_is_sp_updated_MUX_uxn_opcodes_h_l360_c7_d038_cond <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l360_c7_d038_cond;
     result_is_sp_updated_MUX_uxn_opcodes_h_l360_c7_d038_iftrue <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l360_c7_d038_iftrue;
     result_is_sp_updated_MUX_uxn_opcodes_h_l360_c7_d038_iffalse <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l360_c7_d038_iffalse;
     -- Outputs
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l360_c7_d038_return_output := result_is_sp_updated_MUX_uxn_opcodes_h_l360_c7_d038_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l360_c7_d038] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l360_c7_d038_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l360_c7_d038_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l360_c7_d038_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l360_c7_d038_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l360_c7_d038_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l360_c7_d038_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l360_c7_d038_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l360_c7_d038_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l381_c24_0b20] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l381_c24_0b20_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l381_c34_f704_return_output);

     -- CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l391_l371_DUPLICATE_5ccd LATENCY=0
     VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l391_l371_DUPLICATE_5ccd_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l391_l371_DUPLICATE_2205_return_output);

     -- result_stack_value_MUX[uxn_opcodes_h_l393_c7_0008] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l393_c7_0008_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l393_c7_0008_cond;
     result_stack_value_MUX_uxn_opcodes_h_l393_c7_0008_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l393_c7_0008_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l393_c7_0008_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l393_c7_0008_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l393_c7_0008_return_output := result_stack_value_MUX_uxn_opcodes_h_l393_c7_0008_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l393_c7_0008] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_0008_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_0008_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_0008_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_0008_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_0008_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_0008_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_0008_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_0008_return_output;

     -- result_stack_address_MUX[uxn_opcodes_h_l393_c7_0008] LATENCY=0
     -- Inputs
     result_stack_address_MUX_uxn_opcodes_h_l393_c7_0008_cond <= VAR_result_stack_address_MUX_uxn_opcodes_h_l393_c7_0008_cond;
     result_stack_address_MUX_uxn_opcodes_h_l393_c7_0008_iftrue <= VAR_result_stack_address_MUX_uxn_opcodes_h_l393_c7_0008_iftrue;
     result_stack_address_MUX_uxn_opcodes_h_l393_c7_0008_iffalse <= VAR_result_stack_address_MUX_uxn_opcodes_h_l393_c7_0008_iffalse;
     -- Outputs
     VAR_result_stack_address_MUX_uxn_opcodes_h_l393_c7_0008_return_output := result_stack_address_MUX_uxn_opcodes_h_l393_c7_0008_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l345_l326_DUPLICATE_4a5d LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l345_l326_DUPLICATE_4a5d_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l345_l326_DUPLICATE_4a5d_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l345_l326_DUPLICATE_4a5d_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l345_l326_DUPLICATE_4a5d_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l354_c3_8140] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l354_c3_8140_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l354_c3_8140_left;
     BIN_OP_OR_uxn_opcodes_h_l354_c3_8140_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l354_c3_8140_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l354_c3_8140_return_output := BIN_OP_OR_uxn_opcodes_h_l354_c3_8140_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l393_c7_0008] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_0008_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_0008_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_0008_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_0008_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_0008_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_0008_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_0008_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_0008_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l335_c3_61b6] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l335_c3_61b6_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l335_c3_61b6_left;
     BIN_OP_OR_uxn_opcodes_h_l335_c3_61b6_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l335_c3_61b6_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l335_c3_61b6_return_output := BIN_OP_OR_uxn_opcodes_h_l335_c3_61b6_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l334_c7_5e5c_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l335_c3_61b6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l353_c7_be86_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l354_c3_8140_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l378_c7_0826_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l381_c24_0b20_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l368_c7_aa75_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l391_l371_DUPLICATE_5ccd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l388_c7_4091_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l391_l371_DUPLICATE_5ccd_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l343_c7_e415_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l345_l326_DUPLICATE_4a5d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l324_c7_3000_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l345_l326_DUPLICATE_4a5d_return_output;
     VAR_result_sp_MUX_uxn_opcodes_h_l353_c7_be86_iftrue := VAR_MUX_uxn_opcodes_h_l358_c16_17d6_return_output;
     VAR_printf_uxn_opcodes_h_l314_c3_9541_uxn_opcodes_h_l314_c3_9541_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l313_c1_8a49_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4091_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_0008_return_output;
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l353_c7_be86_iffalse := VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l360_c7_d038_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l353_c7_be86_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l360_c7_d038_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l388_c7_4091_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_0008_return_output;
     VAR_result_sp_MUX_uxn_opcodes_h_l353_c7_be86_iffalse := VAR_result_sp_MUX_uxn_opcodes_h_l360_c7_d038_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l388_c7_4091_iffalse := VAR_result_stack_address_MUX_uxn_opcodes_h_l393_c7_0008_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l388_c7_4091_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l393_c7_0008_return_output;
     -- result_sp_MUX[uxn_opcodes_h_l353_c7_be86] LATENCY=0
     -- Inputs
     result_sp_MUX_uxn_opcodes_h_l353_c7_be86_cond <= VAR_result_sp_MUX_uxn_opcodes_h_l353_c7_be86_cond;
     result_sp_MUX_uxn_opcodes_h_l353_c7_be86_iftrue <= VAR_result_sp_MUX_uxn_opcodes_h_l353_c7_be86_iftrue;
     result_sp_MUX_uxn_opcodes_h_l353_c7_be86_iffalse <= VAR_result_sp_MUX_uxn_opcodes_h_l353_c7_be86_iffalse;
     -- Outputs
     VAR_result_sp_MUX_uxn_opcodes_h_l353_c7_be86_return_output := result_sp_MUX_uxn_opcodes_h_l353_c7_be86_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l353_c7_be86] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l353_c7_be86_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l353_c7_be86_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l353_c7_be86_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l353_c7_be86_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l353_c7_be86_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l353_c7_be86_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l353_c7_be86_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l353_c7_be86_return_output;

     -- printf_uxn_opcodes_h_l314_c3_9541[uxn_opcodes_h_l314_c3_9541] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l314_c3_9541_uxn_opcodes_h_l314_c3_9541_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l314_c3_9541_uxn_opcodes_h_l314_c3_9541_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_sp_updated_MUX[uxn_opcodes_h_l353_c7_be86] LATENCY=0
     -- Inputs
     result_is_sp_updated_MUX_uxn_opcodes_h_l353_c7_be86_cond <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l353_c7_be86_cond;
     result_is_sp_updated_MUX_uxn_opcodes_h_l353_c7_be86_iftrue <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l353_c7_be86_iftrue;
     result_is_sp_updated_MUX_uxn_opcodes_h_l353_c7_be86_iffalse <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l353_c7_be86_iffalse;
     -- Outputs
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l353_c7_be86_return_output := result_is_sp_updated_MUX_uxn_opcodes_h_l353_c7_be86_return_output;

     -- n16_MUX[uxn_opcodes_h_l353_c7_be86] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l353_c7_be86_cond <= VAR_n16_MUX_uxn_opcodes_h_l353_c7_be86_cond;
     n16_MUX_uxn_opcodes_h_l353_c7_be86_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l353_c7_be86_iftrue;
     n16_MUX_uxn_opcodes_h_l353_c7_be86_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l353_c7_be86_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l353_c7_be86_return_output := n16_MUX_uxn_opcodes_h_l353_c7_be86_return_output;

     -- t16_MUX[uxn_opcodes_h_l334_c7_5e5c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l334_c7_5e5c_cond <= VAR_t16_MUX_uxn_opcodes_h_l334_c7_5e5c_cond;
     t16_MUX_uxn_opcodes_h_l334_c7_5e5c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l334_c7_5e5c_iftrue;
     t16_MUX_uxn_opcodes_h_l334_c7_5e5c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l334_c7_5e5c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l334_c7_5e5c_return_output := t16_MUX_uxn_opcodes_h_l334_c7_5e5c_return_output;

     -- result_stack_address_MUX[uxn_opcodes_h_l388_c7_4091] LATENCY=0
     -- Inputs
     result_stack_address_MUX_uxn_opcodes_h_l388_c7_4091_cond <= VAR_result_stack_address_MUX_uxn_opcodes_h_l388_c7_4091_cond;
     result_stack_address_MUX_uxn_opcodes_h_l388_c7_4091_iftrue <= VAR_result_stack_address_MUX_uxn_opcodes_h_l388_c7_4091_iftrue;
     result_stack_address_MUX_uxn_opcodes_h_l388_c7_4091_iffalse <= VAR_result_stack_address_MUX_uxn_opcodes_h_l388_c7_4091_iffalse;
     -- Outputs
     VAR_result_stack_address_MUX_uxn_opcodes_h_l388_c7_4091_return_output := result_stack_address_MUX_uxn_opcodes_h_l388_c7_4091_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l388_c7_4091] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l388_c7_4091_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l388_c7_4091_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l388_c7_4091_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l388_c7_4091_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l388_c7_4091_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l388_c7_4091_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l388_c7_4091_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l388_c7_4091_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l388_c7_4091] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l388_c7_4091_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l388_c7_4091_cond;
     result_stack_value_MUX_uxn_opcodes_h_l388_c7_4091_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l388_c7_4091_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l388_c7_4091_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l388_c7_4091_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l388_c7_4091_return_output := result_stack_value_MUX_uxn_opcodes_h_l388_c7_4091_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l388_c7_4091] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4091_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4091_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4091_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4091_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4091_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4091_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4091_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4091_return_output;

     -- Submodule level 3
     VAR_n16_MUX_uxn_opcodes_h_l349_c7_6611_iffalse := VAR_n16_MUX_uxn_opcodes_h_l353_c7_be86_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l383_c7_7401_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4091_return_output;
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l349_c7_6611_iffalse := VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l353_c7_be86_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l349_c7_6611_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l353_c7_be86_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l383_c7_7401_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l388_c7_4091_return_output;
     VAR_result_sp_MUX_uxn_opcodes_h_l349_c7_6611_iffalse := VAR_result_sp_MUX_uxn_opcodes_h_l353_c7_be86_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l383_c7_7401_iffalse := VAR_result_stack_address_MUX_uxn_opcodes_h_l388_c7_4091_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l383_c7_7401_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l388_c7_4091_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l330_c7_b40c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l334_c7_5e5c_return_output;
     -- result_sp_MUX[uxn_opcodes_h_l349_c7_6611] LATENCY=0
     -- Inputs
     result_sp_MUX_uxn_opcodes_h_l349_c7_6611_cond <= VAR_result_sp_MUX_uxn_opcodes_h_l349_c7_6611_cond;
     result_sp_MUX_uxn_opcodes_h_l349_c7_6611_iftrue <= VAR_result_sp_MUX_uxn_opcodes_h_l349_c7_6611_iftrue;
     result_sp_MUX_uxn_opcodes_h_l349_c7_6611_iffalse <= VAR_result_sp_MUX_uxn_opcodes_h_l349_c7_6611_iffalse;
     -- Outputs
     VAR_result_sp_MUX_uxn_opcodes_h_l349_c7_6611_return_output := result_sp_MUX_uxn_opcodes_h_l349_c7_6611_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l383_c7_7401] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l383_c7_7401_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l383_c7_7401_cond;
     result_stack_value_MUX_uxn_opcodes_h_l383_c7_7401_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l383_c7_7401_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l383_c7_7401_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l383_c7_7401_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l383_c7_7401_return_output := result_stack_value_MUX_uxn_opcodes_h_l383_c7_7401_return_output;

     -- n16_MUX[uxn_opcodes_h_l349_c7_6611] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l349_c7_6611_cond <= VAR_n16_MUX_uxn_opcodes_h_l349_c7_6611_cond;
     n16_MUX_uxn_opcodes_h_l349_c7_6611_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l349_c7_6611_iftrue;
     n16_MUX_uxn_opcodes_h_l349_c7_6611_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l349_c7_6611_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l349_c7_6611_return_output := n16_MUX_uxn_opcodes_h_l349_c7_6611_return_output;

     -- t16_MUX[uxn_opcodes_h_l330_c7_b40c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l330_c7_b40c_cond <= VAR_t16_MUX_uxn_opcodes_h_l330_c7_b40c_cond;
     t16_MUX_uxn_opcodes_h_l330_c7_b40c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l330_c7_b40c_iftrue;
     t16_MUX_uxn_opcodes_h_l330_c7_b40c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l330_c7_b40c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l330_c7_b40c_return_output := t16_MUX_uxn_opcodes_h_l330_c7_b40c_return_output;

     -- result_is_sp_updated_MUX[uxn_opcodes_h_l349_c7_6611] LATENCY=0
     -- Inputs
     result_is_sp_updated_MUX_uxn_opcodes_h_l349_c7_6611_cond <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l349_c7_6611_cond;
     result_is_sp_updated_MUX_uxn_opcodes_h_l349_c7_6611_iftrue <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l349_c7_6611_iftrue;
     result_is_sp_updated_MUX_uxn_opcodes_h_l349_c7_6611_iffalse <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l349_c7_6611_iffalse;
     -- Outputs
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l349_c7_6611_return_output := result_is_sp_updated_MUX_uxn_opcodes_h_l349_c7_6611_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l383_c7_7401] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l383_c7_7401_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l383_c7_7401_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l383_c7_7401_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l383_c7_7401_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l383_c7_7401_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l383_c7_7401_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l383_c7_7401_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l383_c7_7401_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l383_c7_7401] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l383_c7_7401_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l383_c7_7401_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l383_c7_7401_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l383_c7_7401_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l383_c7_7401_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l383_c7_7401_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l383_c7_7401_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l383_c7_7401_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l349_c7_6611] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l349_c7_6611_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l349_c7_6611_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l349_c7_6611_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l349_c7_6611_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l349_c7_6611_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l349_c7_6611_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l349_c7_6611_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l349_c7_6611_return_output;

     -- result_stack_address_MUX[uxn_opcodes_h_l383_c7_7401] LATENCY=0
     -- Inputs
     result_stack_address_MUX_uxn_opcodes_h_l383_c7_7401_cond <= VAR_result_stack_address_MUX_uxn_opcodes_h_l383_c7_7401_cond;
     result_stack_address_MUX_uxn_opcodes_h_l383_c7_7401_iftrue <= VAR_result_stack_address_MUX_uxn_opcodes_h_l383_c7_7401_iftrue;
     result_stack_address_MUX_uxn_opcodes_h_l383_c7_7401_iffalse <= VAR_result_stack_address_MUX_uxn_opcodes_h_l383_c7_7401_iffalse;
     -- Outputs
     VAR_result_stack_address_MUX_uxn_opcodes_h_l383_c7_7401_return_output := result_stack_address_MUX_uxn_opcodes_h_l383_c7_7401_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l343_c7_e415_iffalse := VAR_n16_MUX_uxn_opcodes_h_l349_c7_6611_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_0826_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l383_c7_7401_return_output;
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l343_c7_e415_iffalse := VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l349_c7_6611_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_e415_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l349_c7_6611_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_0826_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l383_c7_7401_return_output;
     VAR_result_sp_MUX_uxn_opcodes_h_l343_c7_e415_iffalse := VAR_result_sp_MUX_uxn_opcodes_h_l349_c7_6611_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l378_c7_0826_iffalse := VAR_result_stack_address_MUX_uxn_opcodes_h_l383_c7_7401_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l378_c7_0826_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l383_c7_7401_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l324_c7_3000_iffalse := VAR_t16_MUX_uxn_opcodes_h_l330_c7_b40c_return_output;
     -- result_is_sp_updated_MUX[uxn_opcodes_h_l343_c7_e415] LATENCY=0
     -- Inputs
     result_is_sp_updated_MUX_uxn_opcodes_h_l343_c7_e415_cond <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l343_c7_e415_cond;
     result_is_sp_updated_MUX_uxn_opcodes_h_l343_c7_e415_iftrue <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l343_c7_e415_iftrue;
     result_is_sp_updated_MUX_uxn_opcodes_h_l343_c7_e415_iffalse <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l343_c7_e415_iffalse;
     -- Outputs
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l343_c7_e415_return_output := result_is_sp_updated_MUX_uxn_opcodes_h_l343_c7_e415_return_output;

     -- result_stack_address_MUX[uxn_opcodes_h_l378_c7_0826] LATENCY=0
     -- Inputs
     result_stack_address_MUX_uxn_opcodes_h_l378_c7_0826_cond <= VAR_result_stack_address_MUX_uxn_opcodes_h_l378_c7_0826_cond;
     result_stack_address_MUX_uxn_opcodes_h_l378_c7_0826_iftrue <= VAR_result_stack_address_MUX_uxn_opcodes_h_l378_c7_0826_iftrue;
     result_stack_address_MUX_uxn_opcodes_h_l378_c7_0826_iffalse <= VAR_result_stack_address_MUX_uxn_opcodes_h_l378_c7_0826_iffalse;
     -- Outputs
     VAR_result_stack_address_MUX_uxn_opcodes_h_l378_c7_0826_return_output := result_stack_address_MUX_uxn_opcodes_h_l378_c7_0826_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l378_c7_0826] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_0826_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_0826_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_0826_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_0826_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_0826_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_0826_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_0826_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_0826_return_output;

     -- n16_MUX[uxn_opcodes_h_l343_c7_e415] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l343_c7_e415_cond <= VAR_n16_MUX_uxn_opcodes_h_l343_c7_e415_cond;
     n16_MUX_uxn_opcodes_h_l343_c7_e415_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l343_c7_e415_iftrue;
     n16_MUX_uxn_opcodes_h_l343_c7_e415_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l343_c7_e415_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l343_c7_e415_return_output := n16_MUX_uxn_opcodes_h_l343_c7_e415_return_output;

     -- t16_MUX[uxn_opcodes_h_l324_c7_3000] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l324_c7_3000_cond <= VAR_t16_MUX_uxn_opcodes_h_l324_c7_3000_cond;
     t16_MUX_uxn_opcodes_h_l324_c7_3000_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l324_c7_3000_iftrue;
     t16_MUX_uxn_opcodes_h_l324_c7_3000_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l324_c7_3000_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l324_c7_3000_return_output := t16_MUX_uxn_opcodes_h_l324_c7_3000_return_output;

     -- result_sp_MUX[uxn_opcodes_h_l343_c7_e415] LATENCY=0
     -- Inputs
     result_sp_MUX_uxn_opcodes_h_l343_c7_e415_cond <= VAR_result_sp_MUX_uxn_opcodes_h_l343_c7_e415_cond;
     result_sp_MUX_uxn_opcodes_h_l343_c7_e415_iftrue <= VAR_result_sp_MUX_uxn_opcodes_h_l343_c7_e415_iftrue;
     result_sp_MUX_uxn_opcodes_h_l343_c7_e415_iffalse <= VAR_result_sp_MUX_uxn_opcodes_h_l343_c7_e415_iffalse;
     -- Outputs
     VAR_result_sp_MUX_uxn_opcodes_h_l343_c7_e415_return_output := result_sp_MUX_uxn_opcodes_h_l343_c7_e415_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l378_c7_0826] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_0826_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_0826_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_0826_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_0826_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_0826_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_0826_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_0826_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_0826_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l378_c7_0826] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l378_c7_0826_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l378_c7_0826_cond;
     result_stack_value_MUX_uxn_opcodes_h_l378_c7_0826_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l378_c7_0826_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l378_c7_0826_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l378_c7_0826_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l378_c7_0826_return_output := result_stack_value_MUX_uxn_opcodes_h_l378_c7_0826_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l343_c7_e415] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_e415_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_e415_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_e415_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_e415_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_e415_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_e415_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_e415_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_e415_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l339_c7_6b80_iffalse := VAR_n16_MUX_uxn_opcodes_h_l343_c7_e415_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_2ca9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_0826_return_output;
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l339_c7_6b80_iffalse := VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l343_c7_e415_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_6b80_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_e415_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_2ca9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_0826_return_output;
     VAR_result_sp_MUX_uxn_opcodes_h_l339_c7_6b80_iffalse := VAR_result_sp_MUX_uxn_opcodes_h_l343_c7_e415_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l373_c7_2ca9_iffalse := VAR_result_stack_address_MUX_uxn_opcodes_h_l378_c7_0826_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l373_c7_2ca9_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l378_c7_0826_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l320_c7_a123_iffalse := VAR_t16_MUX_uxn_opcodes_h_l324_c7_3000_return_output;
     -- t16_MUX[uxn_opcodes_h_l320_c7_a123] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l320_c7_a123_cond <= VAR_t16_MUX_uxn_opcodes_h_l320_c7_a123_cond;
     t16_MUX_uxn_opcodes_h_l320_c7_a123_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l320_c7_a123_iftrue;
     t16_MUX_uxn_opcodes_h_l320_c7_a123_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l320_c7_a123_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l320_c7_a123_return_output := t16_MUX_uxn_opcodes_h_l320_c7_a123_return_output;

     -- result_is_sp_updated_MUX[uxn_opcodes_h_l339_c7_6b80] LATENCY=0
     -- Inputs
     result_is_sp_updated_MUX_uxn_opcodes_h_l339_c7_6b80_cond <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l339_c7_6b80_cond;
     result_is_sp_updated_MUX_uxn_opcodes_h_l339_c7_6b80_iftrue <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l339_c7_6b80_iftrue;
     result_is_sp_updated_MUX_uxn_opcodes_h_l339_c7_6b80_iffalse <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l339_c7_6b80_iffalse;
     -- Outputs
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l339_c7_6b80_return_output := result_is_sp_updated_MUX_uxn_opcodes_h_l339_c7_6b80_return_output;

     -- result_sp_MUX[uxn_opcodes_h_l339_c7_6b80] LATENCY=0
     -- Inputs
     result_sp_MUX_uxn_opcodes_h_l339_c7_6b80_cond <= VAR_result_sp_MUX_uxn_opcodes_h_l339_c7_6b80_cond;
     result_sp_MUX_uxn_opcodes_h_l339_c7_6b80_iftrue <= VAR_result_sp_MUX_uxn_opcodes_h_l339_c7_6b80_iftrue;
     result_sp_MUX_uxn_opcodes_h_l339_c7_6b80_iffalse <= VAR_result_sp_MUX_uxn_opcodes_h_l339_c7_6b80_iffalse;
     -- Outputs
     VAR_result_sp_MUX_uxn_opcodes_h_l339_c7_6b80_return_output := result_sp_MUX_uxn_opcodes_h_l339_c7_6b80_return_output;

     -- result_stack_address_MUX[uxn_opcodes_h_l373_c7_2ca9] LATENCY=0
     -- Inputs
     result_stack_address_MUX_uxn_opcodes_h_l373_c7_2ca9_cond <= VAR_result_stack_address_MUX_uxn_opcodes_h_l373_c7_2ca9_cond;
     result_stack_address_MUX_uxn_opcodes_h_l373_c7_2ca9_iftrue <= VAR_result_stack_address_MUX_uxn_opcodes_h_l373_c7_2ca9_iftrue;
     result_stack_address_MUX_uxn_opcodes_h_l373_c7_2ca9_iffalse <= VAR_result_stack_address_MUX_uxn_opcodes_h_l373_c7_2ca9_iffalse;
     -- Outputs
     VAR_result_stack_address_MUX_uxn_opcodes_h_l373_c7_2ca9_return_output := result_stack_address_MUX_uxn_opcodes_h_l373_c7_2ca9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l373_c7_2ca9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_2ca9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_2ca9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_2ca9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_2ca9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_2ca9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_2ca9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_2ca9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_2ca9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l373_c7_2ca9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_2ca9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_2ca9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_2ca9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_2ca9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_2ca9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_2ca9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_2ca9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_2ca9_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l373_c7_2ca9] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l373_c7_2ca9_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l373_c7_2ca9_cond;
     result_stack_value_MUX_uxn_opcodes_h_l373_c7_2ca9_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l373_c7_2ca9_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l373_c7_2ca9_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l373_c7_2ca9_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l373_c7_2ca9_return_output := result_stack_value_MUX_uxn_opcodes_h_l373_c7_2ca9_return_output;

     -- n16_MUX[uxn_opcodes_h_l339_c7_6b80] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l339_c7_6b80_cond <= VAR_n16_MUX_uxn_opcodes_h_l339_c7_6b80_cond;
     n16_MUX_uxn_opcodes_h_l339_c7_6b80_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l339_c7_6b80_iftrue;
     n16_MUX_uxn_opcodes_h_l339_c7_6b80_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l339_c7_6b80_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l339_c7_6b80_return_output := n16_MUX_uxn_opcodes_h_l339_c7_6b80_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l339_c7_6b80] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_6b80_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_6b80_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_6b80_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_6b80_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_6b80_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_6b80_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_6b80_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_6b80_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l334_c7_5e5c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l339_c7_6b80_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_aa75_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_2ca9_return_output;
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l334_c7_5e5c_iffalse := VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l339_c7_6b80_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l334_c7_5e5c_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_6b80_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_aa75_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_2ca9_return_output;
     VAR_result_sp_MUX_uxn_opcodes_h_l334_c7_5e5c_iffalse := VAR_result_sp_MUX_uxn_opcodes_h_l339_c7_6b80_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l368_c7_aa75_iffalse := VAR_result_stack_address_MUX_uxn_opcodes_h_l373_c7_2ca9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l368_c7_aa75_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l373_c7_2ca9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l313_c2_a794_iffalse := VAR_t16_MUX_uxn_opcodes_h_l320_c7_a123_return_output;
     -- n16_MUX[uxn_opcodes_h_l334_c7_5e5c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l334_c7_5e5c_cond <= VAR_n16_MUX_uxn_opcodes_h_l334_c7_5e5c_cond;
     n16_MUX_uxn_opcodes_h_l334_c7_5e5c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l334_c7_5e5c_iftrue;
     n16_MUX_uxn_opcodes_h_l334_c7_5e5c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l334_c7_5e5c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l334_c7_5e5c_return_output := n16_MUX_uxn_opcodes_h_l334_c7_5e5c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l368_c7_aa75] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_aa75_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_aa75_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_aa75_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_aa75_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_aa75_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_aa75_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_aa75_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_aa75_return_output;

     -- result_is_sp_updated_MUX[uxn_opcodes_h_l334_c7_5e5c] LATENCY=0
     -- Inputs
     result_is_sp_updated_MUX_uxn_opcodes_h_l334_c7_5e5c_cond <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l334_c7_5e5c_cond;
     result_is_sp_updated_MUX_uxn_opcodes_h_l334_c7_5e5c_iftrue <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l334_c7_5e5c_iftrue;
     result_is_sp_updated_MUX_uxn_opcodes_h_l334_c7_5e5c_iffalse <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l334_c7_5e5c_iffalse;
     -- Outputs
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l334_c7_5e5c_return_output := result_is_sp_updated_MUX_uxn_opcodes_h_l334_c7_5e5c_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l334_c7_5e5c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l334_c7_5e5c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l334_c7_5e5c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l334_c7_5e5c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l334_c7_5e5c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l334_c7_5e5c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l334_c7_5e5c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l334_c7_5e5c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l334_c7_5e5c_return_output;

     -- result_sp_MUX[uxn_opcodes_h_l334_c7_5e5c] LATENCY=0
     -- Inputs
     result_sp_MUX_uxn_opcodes_h_l334_c7_5e5c_cond <= VAR_result_sp_MUX_uxn_opcodes_h_l334_c7_5e5c_cond;
     result_sp_MUX_uxn_opcodes_h_l334_c7_5e5c_iftrue <= VAR_result_sp_MUX_uxn_opcodes_h_l334_c7_5e5c_iftrue;
     result_sp_MUX_uxn_opcodes_h_l334_c7_5e5c_iffalse <= VAR_result_sp_MUX_uxn_opcodes_h_l334_c7_5e5c_iffalse;
     -- Outputs
     VAR_result_sp_MUX_uxn_opcodes_h_l334_c7_5e5c_return_output := result_sp_MUX_uxn_opcodes_h_l334_c7_5e5c_return_output;

     -- t16_MUX[uxn_opcodes_h_l313_c2_a794] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l313_c2_a794_cond <= VAR_t16_MUX_uxn_opcodes_h_l313_c2_a794_cond;
     t16_MUX_uxn_opcodes_h_l313_c2_a794_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l313_c2_a794_iftrue;
     t16_MUX_uxn_opcodes_h_l313_c2_a794_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l313_c2_a794_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l313_c2_a794_return_output := t16_MUX_uxn_opcodes_h_l313_c2_a794_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l368_c7_aa75] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l368_c7_aa75_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l368_c7_aa75_cond;
     result_stack_value_MUX_uxn_opcodes_h_l368_c7_aa75_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l368_c7_aa75_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l368_c7_aa75_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l368_c7_aa75_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l368_c7_aa75_return_output := result_stack_value_MUX_uxn_opcodes_h_l368_c7_aa75_return_output;

     -- result_stack_address_MUX[uxn_opcodes_h_l368_c7_aa75] LATENCY=0
     -- Inputs
     result_stack_address_MUX_uxn_opcodes_h_l368_c7_aa75_cond <= VAR_result_stack_address_MUX_uxn_opcodes_h_l368_c7_aa75_cond;
     result_stack_address_MUX_uxn_opcodes_h_l368_c7_aa75_iftrue <= VAR_result_stack_address_MUX_uxn_opcodes_h_l368_c7_aa75_iftrue;
     result_stack_address_MUX_uxn_opcodes_h_l368_c7_aa75_iffalse <= VAR_result_stack_address_MUX_uxn_opcodes_h_l368_c7_aa75_iffalse;
     -- Outputs
     VAR_result_stack_address_MUX_uxn_opcodes_h_l368_c7_aa75_return_output := result_stack_address_MUX_uxn_opcodes_h_l368_c7_aa75_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l368_c7_aa75] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_aa75_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_aa75_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_aa75_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_aa75_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_aa75_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_aa75_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_aa75_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_aa75_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l330_c7_b40c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l334_c7_5e5c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_d038_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_aa75_return_output;
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l330_c7_b40c_iffalse := VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l334_c7_5e5c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l330_c7_b40c_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l334_c7_5e5c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_d038_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_aa75_return_output;
     VAR_result_sp_MUX_uxn_opcodes_h_l330_c7_b40c_iffalse := VAR_result_sp_MUX_uxn_opcodes_h_l334_c7_5e5c_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l360_c7_d038_iffalse := VAR_result_stack_address_MUX_uxn_opcodes_h_l368_c7_aa75_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l360_c7_d038_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l368_c7_aa75_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l313_c2_a794_return_output;
     -- result_stack_address_MUX[uxn_opcodes_h_l360_c7_d038] LATENCY=0
     -- Inputs
     result_stack_address_MUX_uxn_opcodes_h_l360_c7_d038_cond <= VAR_result_stack_address_MUX_uxn_opcodes_h_l360_c7_d038_cond;
     result_stack_address_MUX_uxn_opcodes_h_l360_c7_d038_iftrue <= VAR_result_stack_address_MUX_uxn_opcodes_h_l360_c7_d038_iftrue;
     result_stack_address_MUX_uxn_opcodes_h_l360_c7_d038_iffalse <= VAR_result_stack_address_MUX_uxn_opcodes_h_l360_c7_d038_iffalse;
     -- Outputs
     VAR_result_stack_address_MUX_uxn_opcodes_h_l360_c7_d038_return_output := result_stack_address_MUX_uxn_opcodes_h_l360_c7_d038_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l360_c7_d038] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_d038_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_d038_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_d038_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_d038_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_d038_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_d038_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_d038_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_d038_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l330_c7_b40c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l330_c7_b40c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l330_c7_b40c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l330_c7_b40c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l330_c7_b40c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l330_c7_b40c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l330_c7_b40c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l330_c7_b40c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l330_c7_b40c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l360_c7_d038] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l360_c7_d038_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l360_c7_d038_cond;
     result_stack_value_MUX_uxn_opcodes_h_l360_c7_d038_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l360_c7_d038_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l360_c7_d038_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l360_c7_d038_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l360_c7_d038_return_output := result_stack_value_MUX_uxn_opcodes_h_l360_c7_d038_return_output;

     -- n16_MUX[uxn_opcodes_h_l330_c7_b40c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l330_c7_b40c_cond <= VAR_n16_MUX_uxn_opcodes_h_l330_c7_b40c_cond;
     n16_MUX_uxn_opcodes_h_l330_c7_b40c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l330_c7_b40c_iftrue;
     n16_MUX_uxn_opcodes_h_l330_c7_b40c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l330_c7_b40c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l330_c7_b40c_return_output := n16_MUX_uxn_opcodes_h_l330_c7_b40c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l360_c7_d038] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_d038_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_d038_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_d038_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_d038_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_d038_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_d038_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_d038_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_d038_return_output;

     -- result_is_sp_updated_MUX[uxn_opcodes_h_l330_c7_b40c] LATENCY=0
     -- Inputs
     result_is_sp_updated_MUX_uxn_opcodes_h_l330_c7_b40c_cond <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l330_c7_b40c_cond;
     result_is_sp_updated_MUX_uxn_opcodes_h_l330_c7_b40c_iftrue <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l330_c7_b40c_iftrue;
     result_is_sp_updated_MUX_uxn_opcodes_h_l330_c7_b40c_iffalse <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l330_c7_b40c_iffalse;
     -- Outputs
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l330_c7_b40c_return_output := result_is_sp_updated_MUX_uxn_opcodes_h_l330_c7_b40c_return_output;

     -- result_sp_MUX[uxn_opcodes_h_l330_c7_b40c] LATENCY=0
     -- Inputs
     result_sp_MUX_uxn_opcodes_h_l330_c7_b40c_cond <= VAR_result_sp_MUX_uxn_opcodes_h_l330_c7_b40c_cond;
     result_sp_MUX_uxn_opcodes_h_l330_c7_b40c_iftrue <= VAR_result_sp_MUX_uxn_opcodes_h_l330_c7_b40c_iftrue;
     result_sp_MUX_uxn_opcodes_h_l330_c7_b40c_iffalse <= VAR_result_sp_MUX_uxn_opcodes_h_l330_c7_b40c_iffalse;
     -- Outputs
     VAR_result_sp_MUX_uxn_opcodes_h_l330_c7_b40c_return_output := result_sp_MUX_uxn_opcodes_h_l330_c7_b40c_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l324_c7_3000_iffalse := VAR_n16_MUX_uxn_opcodes_h_l330_c7_b40c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_be86_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_d038_return_output;
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l324_c7_3000_iffalse := VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l330_c7_b40c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l324_c7_3000_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l330_c7_b40c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_be86_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_d038_return_output;
     VAR_result_sp_MUX_uxn_opcodes_h_l324_c7_3000_iffalse := VAR_result_sp_MUX_uxn_opcodes_h_l330_c7_b40c_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l353_c7_be86_iffalse := VAR_result_stack_address_MUX_uxn_opcodes_h_l360_c7_d038_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l353_c7_be86_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l360_c7_d038_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l353_c7_be86] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l353_c7_be86_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l353_c7_be86_cond;
     result_stack_value_MUX_uxn_opcodes_h_l353_c7_be86_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l353_c7_be86_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l353_c7_be86_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l353_c7_be86_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l353_c7_be86_return_output := result_stack_value_MUX_uxn_opcodes_h_l353_c7_be86_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l353_c7_be86] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_be86_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_be86_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_be86_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_be86_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_be86_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_be86_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_be86_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_be86_return_output;

     -- result_stack_address_MUX[uxn_opcodes_h_l353_c7_be86] LATENCY=0
     -- Inputs
     result_stack_address_MUX_uxn_opcodes_h_l353_c7_be86_cond <= VAR_result_stack_address_MUX_uxn_opcodes_h_l353_c7_be86_cond;
     result_stack_address_MUX_uxn_opcodes_h_l353_c7_be86_iftrue <= VAR_result_stack_address_MUX_uxn_opcodes_h_l353_c7_be86_iftrue;
     result_stack_address_MUX_uxn_opcodes_h_l353_c7_be86_iffalse <= VAR_result_stack_address_MUX_uxn_opcodes_h_l353_c7_be86_iffalse;
     -- Outputs
     VAR_result_stack_address_MUX_uxn_opcodes_h_l353_c7_be86_return_output := result_stack_address_MUX_uxn_opcodes_h_l353_c7_be86_return_output;

     -- result_is_sp_updated_MUX[uxn_opcodes_h_l324_c7_3000] LATENCY=0
     -- Inputs
     result_is_sp_updated_MUX_uxn_opcodes_h_l324_c7_3000_cond <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l324_c7_3000_cond;
     result_is_sp_updated_MUX_uxn_opcodes_h_l324_c7_3000_iftrue <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l324_c7_3000_iftrue;
     result_is_sp_updated_MUX_uxn_opcodes_h_l324_c7_3000_iffalse <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l324_c7_3000_iffalse;
     -- Outputs
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l324_c7_3000_return_output := result_is_sp_updated_MUX_uxn_opcodes_h_l324_c7_3000_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l353_c7_be86] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_be86_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_be86_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_be86_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_be86_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_be86_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_be86_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_be86_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_be86_return_output;

     -- result_sp_MUX[uxn_opcodes_h_l324_c7_3000] LATENCY=0
     -- Inputs
     result_sp_MUX_uxn_opcodes_h_l324_c7_3000_cond <= VAR_result_sp_MUX_uxn_opcodes_h_l324_c7_3000_cond;
     result_sp_MUX_uxn_opcodes_h_l324_c7_3000_iftrue <= VAR_result_sp_MUX_uxn_opcodes_h_l324_c7_3000_iftrue;
     result_sp_MUX_uxn_opcodes_h_l324_c7_3000_iffalse <= VAR_result_sp_MUX_uxn_opcodes_h_l324_c7_3000_iffalse;
     -- Outputs
     VAR_result_sp_MUX_uxn_opcodes_h_l324_c7_3000_return_output := result_sp_MUX_uxn_opcodes_h_l324_c7_3000_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l324_c7_3000] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l324_c7_3000_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l324_c7_3000_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l324_c7_3000_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l324_c7_3000_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l324_c7_3000_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l324_c7_3000_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l324_c7_3000_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l324_c7_3000_return_output;

     -- n16_MUX[uxn_opcodes_h_l324_c7_3000] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l324_c7_3000_cond <= VAR_n16_MUX_uxn_opcodes_h_l324_c7_3000_cond;
     n16_MUX_uxn_opcodes_h_l324_c7_3000_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l324_c7_3000_iftrue;
     n16_MUX_uxn_opcodes_h_l324_c7_3000_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l324_c7_3000_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l324_c7_3000_return_output := n16_MUX_uxn_opcodes_h_l324_c7_3000_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l320_c7_a123_iffalse := VAR_n16_MUX_uxn_opcodes_h_l324_c7_3000_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_6611_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_be86_return_output;
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l320_c7_a123_iffalse := VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l324_c7_3000_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_a123_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l324_c7_3000_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_6611_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_be86_return_output;
     VAR_result_sp_MUX_uxn_opcodes_h_l320_c7_a123_iffalse := VAR_result_sp_MUX_uxn_opcodes_h_l324_c7_3000_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l349_c7_6611_iffalse := VAR_result_stack_address_MUX_uxn_opcodes_h_l353_c7_be86_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l349_c7_6611_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l353_c7_be86_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l349_c7_6611] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l349_c7_6611_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l349_c7_6611_cond;
     result_stack_value_MUX_uxn_opcodes_h_l349_c7_6611_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l349_c7_6611_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l349_c7_6611_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l349_c7_6611_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l349_c7_6611_return_output := result_stack_value_MUX_uxn_opcodes_h_l349_c7_6611_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l320_c7_a123] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_a123_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_a123_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_a123_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_a123_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_a123_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_a123_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_a123_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_a123_return_output;

     -- result_stack_address_MUX[uxn_opcodes_h_l349_c7_6611] LATENCY=0
     -- Inputs
     result_stack_address_MUX_uxn_opcodes_h_l349_c7_6611_cond <= VAR_result_stack_address_MUX_uxn_opcodes_h_l349_c7_6611_cond;
     result_stack_address_MUX_uxn_opcodes_h_l349_c7_6611_iftrue <= VAR_result_stack_address_MUX_uxn_opcodes_h_l349_c7_6611_iftrue;
     result_stack_address_MUX_uxn_opcodes_h_l349_c7_6611_iffalse <= VAR_result_stack_address_MUX_uxn_opcodes_h_l349_c7_6611_iffalse;
     -- Outputs
     VAR_result_stack_address_MUX_uxn_opcodes_h_l349_c7_6611_return_output := result_stack_address_MUX_uxn_opcodes_h_l349_c7_6611_return_output;

     -- n16_MUX[uxn_opcodes_h_l320_c7_a123] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l320_c7_a123_cond <= VAR_n16_MUX_uxn_opcodes_h_l320_c7_a123_cond;
     n16_MUX_uxn_opcodes_h_l320_c7_a123_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l320_c7_a123_iftrue;
     n16_MUX_uxn_opcodes_h_l320_c7_a123_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l320_c7_a123_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l320_c7_a123_return_output := n16_MUX_uxn_opcodes_h_l320_c7_a123_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l349_c7_6611] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_6611_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_6611_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_6611_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_6611_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_6611_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_6611_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_6611_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_6611_return_output;

     -- result_is_sp_updated_MUX[uxn_opcodes_h_l320_c7_a123] LATENCY=0
     -- Inputs
     result_is_sp_updated_MUX_uxn_opcodes_h_l320_c7_a123_cond <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l320_c7_a123_cond;
     result_is_sp_updated_MUX_uxn_opcodes_h_l320_c7_a123_iftrue <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l320_c7_a123_iftrue;
     result_is_sp_updated_MUX_uxn_opcodes_h_l320_c7_a123_iffalse <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l320_c7_a123_iffalse;
     -- Outputs
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l320_c7_a123_return_output := result_is_sp_updated_MUX_uxn_opcodes_h_l320_c7_a123_return_output;

     -- result_sp_MUX[uxn_opcodes_h_l320_c7_a123] LATENCY=0
     -- Inputs
     result_sp_MUX_uxn_opcodes_h_l320_c7_a123_cond <= VAR_result_sp_MUX_uxn_opcodes_h_l320_c7_a123_cond;
     result_sp_MUX_uxn_opcodes_h_l320_c7_a123_iftrue <= VAR_result_sp_MUX_uxn_opcodes_h_l320_c7_a123_iftrue;
     result_sp_MUX_uxn_opcodes_h_l320_c7_a123_iffalse <= VAR_result_sp_MUX_uxn_opcodes_h_l320_c7_a123_iffalse;
     -- Outputs
     VAR_result_sp_MUX_uxn_opcodes_h_l320_c7_a123_return_output := result_sp_MUX_uxn_opcodes_h_l320_c7_a123_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l349_c7_6611] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_6611_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_6611_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_6611_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_6611_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_6611_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_6611_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_6611_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_6611_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l313_c2_a794_iffalse := VAR_n16_MUX_uxn_opcodes_h_l320_c7_a123_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_e415_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_6611_return_output;
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l313_c2_a794_iffalse := VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l320_c7_a123_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l313_c2_a794_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_a123_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_e415_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_6611_return_output;
     VAR_result_sp_MUX_uxn_opcodes_h_l313_c2_a794_iffalse := VAR_result_sp_MUX_uxn_opcodes_h_l320_c7_a123_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l343_c7_e415_iffalse := VAR_result_stack_address_MUX_uxn_opcodes_h_l349_c7_6611_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l343_c7_e415_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l349_c7_6611_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l343_c7_e415] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_e415_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_e415_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_e415_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_e415_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_e415_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_e415_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_e415_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_e415_return_output;

     -- result_sp_MUX[uxn_opcodes_h_l313_c2_a794] LATENCY=0
     -- Inputs
     result_sp_MUX_uxn_opcodes_h_l313_c2_a794_cond <= VAR_result_sp_MUX_uxn_opcodes_h_l313_c2_a794_cond;
     result_sp_MUX_uxn_opcodes_h_l313_c2_a794_iftrue <= VAR_result_sp_MUX_uxn_opcodes_h_l313_c2_a794_iftrue;
     result_sp_MUX_uxn_opcodes_h_l313_c2_a794_iffalse <= VAR_result_sp_MUX_uxn_opcodes_h_l313_c2_a794_iffalse;
     -- Outputs
     VAR_result_sp_MUX_uxn_opcodes_h_l313_c2_a794_return_output := result_sp_MUX_uxn_opcodes_h_l313_c2_a794_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l343_c7_e415] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_e415_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_e415_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_e415_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_e415_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_e415_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_e415_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_e415_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_e415_return_output;

     -- n16_MUX[uxn_opcodes_h_l313_c2_a794] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l313_c2_a794_cond <= VAR_n16_MUX_uxn_opcodes_h_l313_c2_a794_cond;
     n16_MUX_uxn_opcodes_h_l313_c2_a794_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l313_c2_a794_iftrue;
     n16_MUX_uxn_opcodes_h_l313_c2_a794_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l313_c2_a794_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l313_c2_a794_return_output := n16_MUX_uxn_opcodes_h_l313_c2_a794_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l343_c7_e415] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l343_c7_e415_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l343_c7_e415_cond;
     result_stack_value_MUX_uxn_opcodes_h_l343_c7_e415_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l343_c7_e415_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l343_c7_e415_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l343_c7_e415_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l343_c7_e415_return_output := result_stack_value_MUX_uxn_opcodes_h_l343_c7_e415_return_output;

     -- result_is_sp_updated_MUX[uxn_opcodes_h_l313_c2_a794] LATENCY=0
     -- Inputs
     result_is_sp_updated_MUX_uxn_opcodes_h_l313_c2_a794_cond <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l313_c2_a794_cond;
     result_is_sp_updated_MUX_uxn_opcodes_h_l313_c2_a794_iftrue <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l313_c2_a794_iftrue;
     result_is_sp_updated_MUX_uxn_opcodes_h_l313_c2_a794_iffalse <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l313_c2_a794_iffalse;
     -- Outputs
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l313_c2_a794_return_output := result_is_sp_updated_MUX_uxn_opcodes_h_l313_c2_a794_return_output;

     -- result_stack_address_MUX[uxn_opcodes_h_l343_c7_e415] LATENCY=0
     -- Inputs
     result_stack_address_MUX_uxn_opcodes_h_l343_c7_e415_cond <= VAR_result_stack_address_MUX_uxn_opcodes_h_l343_c7_e415_cond;
     result_stack_address_MUX_uxn_opcodes_h_l343_c7_e415_iftrue <= VAR_result_stack_address_MUX_uxn_opcodes_h_l343_c7_e415_iftrue;
     result_stack_address_MUX_uxn_opcodes_h_l343_c7_e415_iffalse <= VAR_result_stack_address_MUX_uxn_opcodes_h_l343_c7_e415_iffalse;
     -- Outputs
     VAR_result_stack_address_MUX_uxn_opcodes_h_l343_c7_e415_return_output := result_stack_address_MUX_uxn_opcodes_h_l343_c7_e415_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l313_c2_a794] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l313_c2_a794_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l313_c2_a794_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l313_c2_a794_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l313_c2_a794_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l313_c2_a794_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l313_c2_a794_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l313_c2_a794_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l313_c2_a794_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l313_c2_a794_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_6b80_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_e415_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_6b80_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_e415_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l339_c7_6b80_iffalse := VAR_result_stack_address_MUX_uxn_opcodes_h_l343_c7_e415_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l339_c7_6b80_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l343_c7_e415_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l339_c7_6b80] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_6b80_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_6b80_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_6b80_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_6b80_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_6b80_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_6b80_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_6b80_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_6b80_return_output;

     -- result_stack_address_MUX[uxn_opcodes_h_l339_c7_6b80] LATENCY=0
     -- Inputs
     result_stack_address_MUX_uxn_opcodes_h_l339_c7_6b80_cond <= VAR_result_stack_address_MUX_uxn_opcodes_h_l339_c7_6b80_cond;
     result_stack_address_MUX_uxn_opcodes_h_l339_c7_6b80_iftrue <= VAR_result_stack_address_MUX_uxn_opcodes_h_l339_c7_6b80_iftrue;
     result_stack_address_MUX_uxn_opcodes_h_l339_c7_6b80_iffalse <= VAR_result_stack_address_MUX_uxn_opcodes_h_l339_c7_6b80_iffalse;
     -- Outputs
     VAR_result_stack_address_MUX_uxn_opcodes_h_l339_c7_6b80_return_output := result_stack_address_MUX_uxn_opcodes_h_l339_c7_6b80_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l339_c7_6b80] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_6b80_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_6b80_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_6b80_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_6b80_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_6b80_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_6b80_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_6b80_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_6b80_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l339_c7_6b80] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l339_c7_6b80_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l339_c7_6b80_cond;
     result_stack_value_MUX_uxn_opcodes_h_l339_c7_6b80_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l339_c7_6b80_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l339_c7_6b80_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l339_c7_6b80_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l339_c7_6b80_return_output := result_stack_value_MUX_uxn_opcodes_h_l339_c7_6b80_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l334_c7_5e5c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_6b80_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l334_c7_5e5c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_6b80_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l334_c7_5e5c_iffalse := VAR_result_stack_address_MUX_uxn_opcodes_h_l339_c7_6b80_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l334_c7_5e5c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l339_c7_6b80_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l334_c7_5e5c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l334_c7_5e5c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l334_c7_5e5c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l334_c7_5e5c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l334_c7_5e5c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l334_c7_5e5c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l334_c7_5e5c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l334_c7_5e5c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l334_c7_5e5c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l334_c7_5e5c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l334_c7_5e5c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l334_c7_5e5c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l334_c7_5e5c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l334_c7_5e5c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l334_c7_5e5c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l334_c7_5e5c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l334_c7_5e5c_return_output := result_stack_value_MUX_uxn_opcodes_h_l334_c7_5e5c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l334_c7_5e5c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l334_c7_5e5c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l334_c7_5e5c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l334_c7_5e5c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l334_c7_5e5c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l334_c7_5e5c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l334_c7_5e5c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l334_c7_5e5c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l334_c7_5e5c_return_output;

     -- result_stack_address_MUX[uxn_opcodes_h_l334_c7_5e5c] LATENCY=0
     -- Inputs
     result_stack_address_MUX_uxn_opcodes_h_l334_c7_5e5c_cond <= VAR_result_stack_address_MUX_uxn_opcodes_h_l334_c7_5e5c_cond;
     result_stack_address_MUX_uxn_opcodes_h_l334_c7_5e5c_iftrue <= VAR_result_stack_address_MUX_uxn_opcodes_h_l334_c7_5e5c_iftrue;
     result_stack_address_MUX_uxn_opcodes_h_l334_c7_5e5c_iffalse <= VAR_result_stack_address_MUX_uxn_opcodes_h_l334_c7_5e5c_iffalse;
     -- Outputs
     VAR_result_stack_address_MUX_uxn_opcodes_h_l334_c7_5e5c_return_output := result_stack_address_MUX_uxn_opcodes_h_l334_c7_5e5c_return_output;

     -- Submodule level 13
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l330_c7_b40c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l334_c7_5e5c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l330_c7_b40c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l334_c7_5e5c_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l330_c7_b40c_iffalse := VAR_result_stack_address_MUX_uxn_opcodes_h_l334_c7_5e5c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l330_c7_b40c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l334_c7_5e5c_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l330_c7_b40c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l330_c7_b40c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l330_c7_b40c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l330_c7_b40c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l330_c7_b40c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l330_c7_b40c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l330_c7_b40c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l330_c7_b40c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l330_c7_b40c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l330_c7_b40c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l330_c7_b40c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l330_c7_b40c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l330_c7_b40c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l330_c7_b40c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l330_c7_b40c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l330_c7_b40c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l330_c7_b40c_return_output := result_stack_value_MUX_uxn_opcodes_h_l330_c7_b40c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l330_c7_b40c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l330_c7_b40c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l330_c7_b40c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l330_c7_b40c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l330_c7_b40c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l330_c7_b40c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l330_c7_b40c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l330_c7_b40c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l330_c7_b40c_return_output;

     -- result_stack_address_MUX[uxn_opcodes_h_l330_c7_b40c] LATENCY=0
     -- Inputs
     result_stack_address_MUX_uxn_opcodes_h_l330_c7_b40c_cond <= VAR_result_stack_address_MUX_uxn_opcodes_h_l330_c7_b40c_cond;
     result_stack_address_MUX_uxn_opcodes_h_l330_c7_b40c_iftrue <= VAR_result_stack_address_MUX_uxn_opcodes_h_l330_c7_b40c_iftrue;
     result_stack_address_MUX_uxn_opcodes_h_l330_c7_b40c_iffalse <= VAR_result_stack_address_MUX_uxn_opcodes_h_l330_c7_b40c_iffalse;
     -- Outputs
     VAR_result_stack_address_MUX_uxn_opcodes_h_l330_c7_b40c_return_output := result_stack_address_MUX_uxn_opcodes_h_l330_c7_b40c_return_output;

     -- Submodule level 14
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l324_c7_3000_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l330_c7_b40c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l324_c7_3000_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l330_c7_b40c_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l324_c7_3000_iffalse := VAR_result_stack_address_MUX_uxn_opcodes_h_l330_c7_b40c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l324_c7_3000_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l330_c7_b40c_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l324_c7_3000] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l324_c7_3000_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l324_c7_3000_cond;
     result_stack_value_MUX_uxn_opcodes_h_l324_c7_3000_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l324_c7_3000_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l324_c7_3000_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l324_c7_3000_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l324_c7_3000_return_output := result_stack_value_MUX_uxn_opcodes_h_l324_c7_3000_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l324_c7_3000] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l324_c7_3000_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l324_c7_3000_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l324_c7_3000_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l324_c7_3000_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l324_c7_3000_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l324_c7_3000_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l324_c7_3000_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l324_c7_3000_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l324_c7_3000] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l324_c7_3000_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l324_c7_3000_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l324_c7_3000_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l324_c7_3000_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l324_c7_3000_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l324_c7_3000_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l324_c7_3000_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l324_c7_3000_return_output;

     -- result_stack_address_MUX[uxn_opcodes_h_l324_c7_3000] LATENCY=0
     -- Inputs
     result_stack_address_MUX_uxn_opcodes_h_l324_c7_3000_cond <= VAR_result_stack_address_MUX_uxn_opcodes_h_l324_c7_3000_cond;
     result_stack_address_MUX_uxn_opcodes_h_l324_c7_3000_iftrue <= VAR_result_stack_address_MUX_uxn_opcodes_h_l324_c7_3000_iftrue;
     result_stack_address_MUX_uxn_opcodes_h_l324_c7_3000_iffalse <= VAR_result_stack_address_MUX_uxn_opcodes_h_l324_c7_3000_iffalse;
     -- Outputs
     VAR_result_stack_address_MUX_uxn_opcodes_h_l324_c7_3000_return_output := result_stack_address_MUX_uxn_opcodes_h_l324_c7_3000_return_output;

     -- Submodule level 15
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_a123_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l324_c7_3000_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_a123_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l324_c7_3000_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l320_c7_a123_iffalse := VAR_result_stack_address_MUX_uxn_opcodes_h_l324_c7_3000_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l320_c7_a123_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l324_c7_3000_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l320_c7_a123] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l320_c7_a123_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l320_c7_a123_cond;
     result_stack_value_MUX_uxn_opcodes_h_l320_c7_a123_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l320_c7_a123_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l320_c7_a123_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l320_c7_a123_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l320_c7_a123_return_output := result_stack_value_MUX_uxn_opcodes_h_l320_c7_a123_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l320_c7_a123] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_a123_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_a123_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_a123_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_a123_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_a123_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_a123_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_a123_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_a123_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l320_c7_a123] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_a123_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_a123_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_a123_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_a123_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_a123_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_a123_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_a123_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_a123_return_output;

     -- result_stack_address_MUX[uxn_opcodes_h_l320_c7_a123] LATENCY=0
     -- Inputs
     result_stack_address_MUX_uxn_opcodes_h_l320_c7_a123_cond <= VAR_result_stack_address_MUX_uxn_opcodes_h_l320_c7_a123_cond;
     result_stack_address_MUX_uxn_opcodes_h_l320_c7_a123_iftrue <= VAR_result_stack_address_MUX_uxn_opcodes_h_l320_c7_a123_iftrue;
     result_stack_address_MUX_uxn_opcodes_h_l320_c7_a123_iffalse <= VAR_result_stack_address_MUX_uxn_opcodes_h_l320_c7_a123_iffalse;
     -- Outputs
     VAR_result_stack_address_MUX_uxn_opcodes_h_l320_c7_a123_return_output := result_stack_address_MUX_uxn_opcodes_h_l320_c7_a123_return_output;

     -- Submodule level 16
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l313_c2_a794_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_a123_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l313_c2_a794_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_a123_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l313_c2_a794_iffalse := VAR_result_stack_address_MUX_uxn_opcodes_h_l320_c7_a123_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l313_c2_a794_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l320_c7_a123_return_output;
     -- result_stack_address_MUX[uxn_opcodes_h_l313_c2_a794] LATENCY=0
     -- Inputs
     result_stack_address_MUX_uxn_opcodes_h_l313_c2_a794_cond <= VAR_result_stack_address_MUX_uxn_opcodes_h_l313_c2_a794_cond;
     result_stack_address_MUX_uxn_opcodes_h_l313_c2_a794_iftrue <= VAR_result_stack_address_MUX_uxn_opcodes_h_l313_c2_a794_iftrue;
     result_stack_address_MUX_uxn_opcodes_h_l313_c2_a794_iffalse <= VAR_result_stack_address_MUX_uxn_opcodes_h_l313_c2_a794_iffalse;
     -- Outputs
     VAR_result_stack_address_MUX_uxn_opcodes_h_l313_c2_a794_return_output := result_stack_address_MUX_uxn_opcodes_h_l313_c2_a794_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l313_c2_a794] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l313_c2_a794_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l313_c2_a794_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l313_c2_a794_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l313_c2_a794_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l313_c2_a794_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l313_c2_a794_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l313_c2_a794_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l313_c2_a794_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l313_c2_a794] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l313_c2_a794_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l313_c2_a794_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l313_c2_a794_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l313_c2_a794_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l313_c2_a794_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l313_c2_a794_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l313_c2_a794_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l313_c2_a794_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l313_c2_a794] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l313_c2_a794_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l313_c2_a794_cond;
     result_stack_value_MUX_uxn_opcodes_h_l313_c2_a794_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l313_c2_a794_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l313_c2_a794_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l313_c2_a794_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l313_c2_a794_return_output := result_stack_value_MUX_uxn_opcodes_h_l313_c2_a794_return_output;

     -- Submodule level 17
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_a3be_uxn_opcodes_h_l309_l400_DUPLICATE_8679 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a3be_uxn_opcodes_h_l309_l400_DUPLICATE_8679_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_a3be(
     result,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l313_c2_a794_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l313_c2_a794_return_output,
     VAR_result_sp_MUX_uxn_opcodes_h_l313_c2_a794_return_output,
     VAR_result_stack_address_MUX_uxn_opcodes_h_l313_c2_a794_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l313_c2_a794_return_output,
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l313_c2_a794_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l313_c2_a794_return_output);

     -- Submodule level 18
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a3be_uxn_opcodes_h_l309_l400_DUPLICATE_8679_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a3be_uxn_opcodes_h_l309_l400_DUPLICATE_8679_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
