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
-- Submodules: 58
entity lth2_0CLK_977cbcae is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lth2_0CLK_977cbcae;
architecture arch of lth2_0CLK_977cbcae is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1925_c6_38e3]
signal BIN_OP_EQ_uxn_opcodes_h_l1925_c6_38e3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1925_c6_38e3_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1925_c6_38e3_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1925_c2_1169]
signal result_u8_value_MUX_uxn_opcodes_h_l1925_c2_1169_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1925_c2_1169_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1925_c2_1169_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1925_c2_1169_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1925_c2_1169]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_1169_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_1169_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_1169_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_1169_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1925_c2_1169]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_1169_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_1169_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_1169_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_1169_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1925_c2_1169]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_1169_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_1169_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_1169_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_1169_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1925_c2_1169]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_1169_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_1169_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_1169_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_1169_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1925_c2_1169]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_1169_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_1169_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_1169_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_1169_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1925_c2_1169]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_1169_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_1169_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_1169_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_1169_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1925_c2_1169]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_1169_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_1169_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_1169_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_1169_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1925_c2_1169]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_1169_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_1169_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_1169_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_1169_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1925_c2_1169]
signal n16_MUX_uxn_opcodes_h_l1925_c2_1169_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1925_c2_1169_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1925_c2_1169_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1925_c2_1169_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1925_c2_1169]
signal t16_MUX_uxn_opcodes_h_l1925_c2_1169_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1925_c2_1169_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1925_c2_1169_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1925_c2_1169_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1938_c11_249c]
signal BIN_OP_EQ_uxn_opcodes_h_l1938_c11_249c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1938_c11_249c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1938_c11_249c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1938_c7_4bdc]
signal result_u8_value_MUX_uxn_opcodes_h_l1938_c7_4bdc_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1938_c7_4bdc_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1938_c7_4bdc_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1938_c7_4bdc_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1938_c7_4bdc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_4bdc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_4bdc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_4bdc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_4bdc_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1938_c7_4bdc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_4bdc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_4bdc_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_4bdc_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_4bdc_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1938_c7_4bdc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_4bdc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_4bdc_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_4bdc_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_4bdc_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1938_c7_4bdc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_4bdc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_4bdc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_4bdc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_4bdc_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1938_c7_4bdc]
signal n16_MUX_uxn_opcodes_h_l1938_c7_4bdc_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1938_c7_4bdc_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1938_c7_4bdc_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1938_c7_4bdc_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1938_c7_4bdc]
signal t16_MUX_uxn_opcodes_h_l1938_c7_4bdc_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1938_c7_4bdc_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1938_c7_4bdc_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1938_c7_4bdc_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1941_c11_5957]
signal BIN_OP_EQ_uxn_opcodes_h_l1941_c11_5957_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1941_c11_5957_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1941_c11_5957_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1941_c7_6c79]
signal result_u8_value_MUX_uxn_opcodes_h_l1941_c7_6c79_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1941_c7_6c79_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1941_c7_6c79_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1941_c7_6c79_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1941_c7_6c79]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_6c79_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_6c79_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_6c79_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_6c79_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1941_c7_6c79]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_6c79_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_6c79_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_6c79_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_6c79_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1941_c7_6c79]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_6c79_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_6c79_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_6c79_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_6c79_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1941_c7_6c79]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_6c79_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_6c79_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_6c79_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_6c79_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1941_c7_6c79]
signal n16_MUX_uxn_opcodes_h_l1941_c7_6c79_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1941_c7_6c79_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1941_c7_6c79_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1941_c7_6c79_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1941_c7_6c79]
signal t16_MUX_uxn_opcodes_h_l1941_c7_6c79_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1941_c7_6c79_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1941_c7_6c79_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1941_c7_6c79_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1946_c11_2981]
signal BIN_OP_EQ_uxn_opcodes_h_l1946_c11_2981_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1946_c11_2981_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1946_c11_2981_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1946_c7_7be0]
signal result_u8_value_MUX_uxn_opcodes_h_l1946_c7_7be0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1946_c7_7be0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1946_c7_7be0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1946_c7_7be0_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1946_c7_7be0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_7be0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_7be0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_7be0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_7be0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1946_c7_7be0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_7be0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_7be0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_7be0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_7be0_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1946_c7_7be0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_7be0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_7be0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_7be0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_7be0_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1946_c7_7be0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_7be0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_7be0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_7be0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_7be0_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1946_c7_7be0]
signal n16_MUX_uxn_opcodes_h_l1946_c7_7be0_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1946_c7_7be0_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1946_c7_7be0_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1946_c7_7be0_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1946_c7_7be0]
signal t16_MUX_uxn_opcodes_h_l1946_c7_7be0_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1946_c7_7be0_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1946_c7_7be0_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1946_c7_7be0_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1947_c3_674d]
signal BIN_OP_OR_uxn_opcodes_h_l1947_c3_674d_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1947_c3_674d_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1947_c3_674d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1950_c11_8653]
signal BIN_OP_EQ_uxn_opcodes_h_l1950_c11_8653_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1950_c11_8653_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1950_c11_8653_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1950_c7_0e25]
signal result_u8_value_MUX_uxn_opcodes_h_l1950_c7_0e25_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1950_c7_0e25_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1950_c7_0e25_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1950_c7_0e25_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1950_c7_0e25]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_0e25_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_0e25_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_0e25_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_0e25_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1950_c7_0e25]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_0e25_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_0e25_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_0e25_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_0e25_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1950_c7_0e25]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_0e25_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_0e25_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_0e25_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_0e25_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1950_c7_0e25]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_0e25_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_0e25_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_0e25_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_0e25_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1950_c7_0e25]
signal n16_MUX_uxn_opcodes_h_l1950_c7_0e25_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1950_c7_0e25_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1950_c7_0e25_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1950_c7_0e25_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1954_c11_bf4d]
signal BIN_OP_EQ_uxn_opcodes_h_l1954_c11_bf4d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1954_c11_bf4d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1954_c11_bf4d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1954_c7_d3c1]
signal result_u8_value_MUX_uxn_opcodes_h_l1954_c7_d3c1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1954_c7_d3c1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1954_c7_d3c1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1954_c7_d3c1_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1954_c7_d3c1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_d3c1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_d3c1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_d3c1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_d3c1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1954_c7_d3c1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_d3c1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_d3c1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_d3c1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_d3c1_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1954_c7_d3c1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_d3c1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_d3c1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_d3c1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_d3c1_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1954_c7_d3c1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_d3c1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_d3c1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_d3c1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_d3c1_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1954_c7_d3c1]
signal n16_MUX_uxn_opcodes_h_l1954_c7_d3c1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1954_c7_d3c1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1954_c7_d3c1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1954_c7_d3c1_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1955_c3_141a]
signal BIN_OP_OR_uxn_opcodes_h_l1955_c3_141a_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1955_c3_141a_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1955_c3_141a_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1956_c30_847b]
signal sp_relative_shift_uxn_opcodes_h_l1956_c30_847b_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1956_c30_847b_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1956_c30_847b_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1956_c30_847b_return_output : signed(3 downto 0);

-- BIN_OP_LT[uxn_opcodes_h_l1959_c21_947e]
signal BIN_OP_LT_uxn_opcodes_h_l1959_c21_947e_left : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_opcodes_h_l1959_c21_947e_right : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_opcodes_h_l1959_c21_947e_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1959_c21_a212]
signal MUX_uxn_opcodes_h_l1959_c21_a212_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1959_c21_a212_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1959_c21_a212_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1959_c21_a212_return_output : unsigned(7 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1943_l1952_DUPLICATE_962e
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1943_l1952_DUPLICATE_962e_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1943_l1952_DUPLICATE_962e_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_243c( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : signed;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u8_value := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.is_stack_index_flipped := ref_toks_3;
      base.is_vram_write := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_pc_updated := ref_toks_6;
      base.is_ram_write := ref_toks_7;
      base.sp_relative_shift := ref_toks_8;
      base.is_opc_done := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1925_c6_38e3
BIN_OP_EQ_uxn_opcodes_h_l1925_c6_38e3 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1925_c6_38e3_left,
BIN_OP_EQ_uxn_opcodes_h_l1925_c6_38e3_right,
BIN_OP_EQ_uxn_opcodes_h_l1925_c6_38e3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1925_c2_1169
result_u8_value_MUX_uxn_opcodes_h_l1925_c2_1169 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1925_c2_1169_cond,
result_u8_value_MUX_uxn_opcodes_h_l1925_c2_1169_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1925_c2_1169_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1925_c2_1169_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_1169
result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_1169 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_1169_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_1169_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_1169_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_1169_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_1169
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_1169 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_1169_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_1169_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_1169_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_1169_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_1169
result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_1169 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_1169_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_1169_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_1169_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_1169_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_1169
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_1169 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_1169_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_1169_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_1169_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_1169_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_1169
result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_1169 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_1169_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_1169_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_1169_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_1169_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_1169
result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_1169 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_1169_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_1169_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_1169_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_1169_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_1169
result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_1169 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_1169_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_1169_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_1169_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_1169_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_1169
result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_1169 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_1169_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_1169_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_1169_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_1169_return_output);

-- n16_MUX_uxn_opcodes_h_l1925_c2_1169
n16_MUX_uxn_opcodes_h_l1925_c2_1169 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1925_c2_1169_cond,
n16_MUX_uxn_opcodes_h_l1925_c2_1169_iftrue,
n16_MUX_uxn_opcodes_h_l1925_c2_1169_iffalse,
n16_MUX_uxn_opcodes_h_l1925_c2_1169_return_output);

-- t16_MUX_uxn_opcodes_h_l1925_c2_1169
t16_MUX_uxn_opcodes_h_l1925_c2_1169 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1925_c2_1169_cond,
t16_MUX_uxn_opcodes_h_l1925_c2_1169_iftrue,
t16_MUX_uxn_opcodes_h_l1925_c2_1169_iffalse,
t16_MUX_uxn_opcodes_h_l1925_c2_1169_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1938_c11_249c
BIN_OP_EQ_uxn_opcodes_h_l1938_c11_249c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1938_c11_249c_left,
BIN_OP_EQ_uxn_opcodes_h_l1938_c11_249c_right,
BIN_OP_EQ_uxn_opcodes_h_l1938_c11_249c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1938_c7_4bdc
result_u8_value_MUX_uxn_opcodes_h_l1938_c7_4bdc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1938_c7_4bdc_cond,
result_u8_value_MUX_uxn_opcodes_h_l1938_c7_4bdc_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1938_c7_4bdc_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1938_c7_4bdc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_4bdc
result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_4bdc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_4bdc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_4bdc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_4bdc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_4bdc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_4bdc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_4bdc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_4bdc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_4bdc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_4bdc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_4bdc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_4bdc
result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_4bdc : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_4bdc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_4bdc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_4bdc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_4bdc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_4bdc
result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_4bdc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_4bdc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_4bdc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_4bdc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_4bdc_return_output);

-- n16_MUX_uxn_opcodes_h_l1938_c7_4bdc
n16_MUX_uxn_opcodes_h_l1938_c7_4bdc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1938_c7_4bdc_cond,
n16_MUX_uxn_opcodes_h_l1938_c7_4bdc_iftrue,
n16_MUX_uxn_opcodes_h_l1938_c7_4bdc_iffalse,
n16_MUX_uxn_opcodes_h_l1938_c7_4bdc_return_output);

-- t16_MUX_uxn_opcodes_h_l1938_c7_4bdc
t16_MUX_uxn_opcodes_h_l1938_c7_4bdc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1938_c7_4bdc_cond,
t16_MUX_uxn_opcodes_h_l1938_c7_4bdc_iftrue,
t16_MUX_uxn_opcodes_h_l1938_c7_4bdc_iffalse,
t16_MUX_uxn_opcodes_h_l1938_c7_4bdc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1941_c11_5957
BIN_OP_EQ_uxn_opcodes_h_l1941_c11_5957 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1941_c11_5957_left,
BIN_OP_EQ_uxn_opcodes_h_l1941_c11_5957_right,
BIN_OP_EQ_uxn_opcodes_h_l1941_c11_5957_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1941_c7_6c79
result_u8_value_MUX_uxn_opcodes_h_l1941_c7_6c79 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1941_c7_6c79_cond,
result_u8_value_MUX_uxn_opcodes_h_l1941_c7_6c79_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1941_c7_6c79_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1941_c7_6c79_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_6c79
result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_6c79 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_6c79_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_6c79_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_6c79_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_6c79_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_6c79
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_6c79 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_6c79_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_6c79_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_6c79_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_6c79_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_6c79
result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_6c79 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_6c79_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_6c79_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_6c79_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_6c79_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_6c79
result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_6c79 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_6c79_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_6c79_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_6c79_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_6c79_return_output);

-- n16_MUX_uxn_opcodes_h_l1941_c7_6c79
n16_MUX_uxn_opcodes_h_l1941_c7_6c79 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1941_c7_6c79_cond,
n16_MUX_uxn_opcodes_h_l1941_c7_6c79_iftrue,
n16_MUX_uxn_opcodes_h_l1941_c7_6c79_iffalse,
n16_MUX_uxn_opcodes_h_l1941_c7_6c79_return_output);

-- t16_MUX_uxn_opcodes_h_l1941_c7_6c79
t16_MUX_uxn_opcodes_h_l1941_c7_6c79 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1941_c7_6c79_cond,
t16_MUX_uxn_opcodes_h_l1941_c7_6c79_iftrue,
t16_MUX_uxn_opcodes_h_l1941_c7_6c79_iffalse,
t16_MUX_uxn_opcodes_h_l1941_c7_6c79_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1946_c11_2981
BIN_OP_EQ_uxn_opcodes_h_l1946_c11_2981 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1946_c11_2981_left,
BIN_OP_EQ_uxn_opcodes_h_l1946_c11_2981_right,
BIN_OP_EQ_uxn_opcodes_h_l1946_c11_2981_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1946_c7_7be0
result_u8_value_MUX_uxn_opcodes_h_l1946_c7_7be0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1946_c7_7be0_cond,
result_u8_value_MUX_uxn_opcodes_h_l1946_c7_7be0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1946_c7_7be0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1946_c7_7be0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_7be0
result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_7be0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_7be0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_7be0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_7be0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_7be0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_7be0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_7be0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_7be0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_7be0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_7be0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_7be0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_7be0
result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_7be0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_7be0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_7be0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_7be0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_7be0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_7be0
result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_7be0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_7be0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_7be0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_7be0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_7be0_return_output);

-- n16_MUX_uxn_opcodes_h_l1946_c7_7be0
n16_MUX_uxn_opcodes_h_l1946_c7_7be0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1946_c7_7be0_cond,
n16_MUX_uxn_opcodes_h_l1946_c7_7be0_iftrue,
n16_MUX_uxn_opcodes_h_l1946_c7_7be0_iffalse,
n16_MUX_uxn_opcodes_h_l1946_c7_7be0_return_output);

-- t16_MUX_uxn_opcodes_h_l1946_c7_7be0
t16_MUX_uxn_opcodes_h_l1946_c7_7be0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1946_c7_7be0_cond,
t16_MUX_uxn_opcodes_h_l1946_c7_7be0_iftrue,
t16_MUX_uxn_opcodes_h_l1946_c7_7be0_iffalse,
t16_MUX_uxn_opcodes_h_l1946_c7_7be0_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1947_c3_674d
BIN_OP_OR_uxn_opcodes_h_l1947_c3_674d : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1947_c3_674d_left,
BIN_OP_OR_uxn_opcodes_h_l1947_c3_674d_right,
BIN_OP_OR_uxn_opcodes_h_l1947_c3_674d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1950_c11_8653
BIN_OP_EQ_uxn_opcodes_h_l1950_c11_8653 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1950_c11_8653_left,
BIN_OP_EQ_uxn_opcodes_h_l1950_c11_8653_right,
BIN_OP_EQ_uxn_opcodes_h_l1950_c11_8653_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1950_c7_0e25
result_u8_value_MUX_uxn_opcodes_h_l1950_c7_0e25 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1950_c7_0e25_cond,
result_u8_value_MUX_uxn_opcodes_h_l1950_c7_0e25_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1950_c7_0e25_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1950_c7_0e25_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_0e25
result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_0e25 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_0e25_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_0e25_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_0e25_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_0e25_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_0e25
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_0e25 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_0e25_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_0e25_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_0e25_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_0e25_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_0e25
result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_0e25 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_0e25_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_0e25_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_0e25_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_0e25_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_0e25
result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_0e25 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_0e25_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_0e25_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_0e25_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_0e25_return_output);

-- n16_MUX_uxn_opcodes_h_l1950_c7_0e25
n16_MUX_uxn_opcodes_h_l1950_c7_0e25 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1950_c7_0e25_cond,
n16_MUX_uxn_opcodes_h_l1950_c7_0e25_iftrue,
n16_MUX_uxn_opcodes_h_l1950_c7_0e25_iffalse,
n16_MUX_uxn_opcodes_h_l1950_c7_0e25_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1954_c11_bf4d
BIN_OP_EQ_uxn_opcodes_h_l1954_c11_bf4d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1954_c11_bf4d_left,
BIN_OP_EQ_uxn_opcodes_h_l1954_c11_bf4d_right,
BIN_OP_EQ_uxn_opcodes_h_l1954_c11_bf4d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1954_c7_d3c1
result_u8_value_MUX_uxn_opcodes_h_l1954_c7_d3c1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1954_c7_d3c1_cond,
result_u8_value_MUX_uxn_opcodes_h_l1954_c7_d3c1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1954_c7_d3c1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1954_c7_d3c1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_d3c1
result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_d3c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_d3c1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_d3c1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_d3c1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_d3c1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_d3c1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_d3c1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_d3c1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_d3c1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_d3c1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_d3c1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_d3c1
result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_d3c1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_d3c1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_d3c1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_d3c1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_d3c1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_d3c1
result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_d3c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_d3c1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_d3c1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_d3c1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_d3c1_return_output);

-- n16_MUX_uxn_opcodes_h_l1954_c7_d3c1
n16_MUX_uxn_opcodes_h_l1954_c7_d3c1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1954_c7_d3c1_cond,
n16_MUX_uxn_opcodes_h_l1954_c7_d3c1_iftrue,
n16_MUX_uxn_opcodes_h_l1954_c7_d3c1_iffalse,
n16_MUX_uxn_opcodes_h_l1954_c7_d3c1_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1955_c3_141a
BIN_OP_OR_uxn_opcodes_h_l1955_c3_141a : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1955_c3_141a_left,
BIN_OP_OR_uxn_opcodes_h_l1955_c3_141a_right,
BIN_OP_OR_uxn_opcodes_h_l1955_c3_141a_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1956_c30_847b
sp_relative_shift_uxn_opcodes_h_l1956_c30_847b : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1956_c30_847b_ins,
sp_relative_shift_uxn_opcodes_h_l1956_c30_847b_x,
sp_relative_shift_uxn_opcodes_h_l1956_c30_847b_y,
sp_relative_shift_uxn_opcodes_h_l1956_c30_847b_return_output);

-- BIN_OP_LT_uxn_opcodes_h_l1959_c21_947e
BIN_OP_LT_uxn_opcodes_h_l1959_c21_947e : entity work.BIN_OP_LT_uint16_t_uint16_t_0CLK_380ecc95 port map (
BIN_OP_LT_uxn_opcodes_h_l1959_c21_947e_left,
BIN_OP_LT_uxn_opcodes_h_l1959_c21_947e_right,
BIN_OP_LT_uxn_opcodes_h_l1959_c21_947e_return_output);

-- MUX_uxn_opcodes_h_l1959_c21_a212
MUX_uxn_opcodes_h_l1959_c21_a212 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1959_c21_a212_cond,
MUX_uxn_opcodes_h_l1959_c21_a212_iftrue,
MUX_uxn_opcodes_h_l1959_c21_a212_iffalse,
MUX_uxn_opcodes_h_l1959_c21_a212_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1943_l1952_DUPLICATE_962e
CONST_SL_8_uint16_t_uxn_opcodes_h_l1943_l1952_DUPLICATE_962e : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1943_l1952_DUPLICATE_962e_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1943_l1952_DUPLICATE_962e_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16,
 n16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1925_c6_38e3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1925_c2_1169_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_1169_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_1169_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_1169_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_1169_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_1169_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_1169_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_1169_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_1169_return_output,
 n16_MUX_uxn_opcodes_h_l1925_c2_1169_return_output,
 t16_MUX_uxn_opcodes_h_l1925_c2_1169_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1938_c11_249c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1938_c7_4bdc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_4bdc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_4bdc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_4bdc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_4bdc_return_output,
 n16_MUX_uxn_opcodes_h_l1938_c7_4bdc_return_output,
 t16_MUX_uxn_opcodes_h_l1938_c7_4bdc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1941_c11_5957_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1941_c7_6c79_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_6c79_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_6c79_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_6c79_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_6c79_return_output,
 n16_MUX_uxn_opcodes_h_l1941_c7_6c79_return_output,
 t16_MUX_uxn_opcodes_h_l1941_c7_6c79_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1946_c11_2981_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1946_c7_7be0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_7be0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_7be0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_7be0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_7be0_return_output,
 n16_MUX_uxn_opcodes_h_l1946_c7_7be0_return_output,
 t16_MUX_uxn_opcodes_h_l1946_c7_7be0_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1947_c3_674d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1950_c11_8653_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1950_c7_0e25_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_0e25_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_0e25_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_0e25_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_0e25_return_output,
 n16_MUX_uxn_opcodes_h_l1950_c7_0e25_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1954_c11_bf4d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1954_c7_d3c1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_d3c1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_d3c1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_d3c1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_d3c1_return_output,
 n16_MUX_uxn_opcodes_h_l1954_c7_d3c1_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1955_c3_141a_return_output,
 sp_relative_shift_uxn_opcodes_h_l1956_c30_847b_return_output,
 BIN_OP_LT_uxn_opcodes_h_l1959_c21_947e_return_output,
 MUX_uxn_opcodes_h_l1959_c21_a212_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1943_l1952_DUPLICATE_962e_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c6_38e3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c6_38e3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c6_38e3_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1925_c2_1169_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1925_c2_1169_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1938_c7_4bdc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1925_c2_1169_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1925_c2_1169_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_1169_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_1169_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_4bdc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_1169_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_1169_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_1169_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_1169_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1925_c2_1169_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_1169_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_1169_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_1169_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_1169_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1925_c2_1169_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_1169_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_1169_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_1169_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1935_c3_f229 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_1169_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_4bdc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_1169_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_1169_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_1169_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_1169_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1925_c2_1169_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_1169_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_1169_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_1169_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_1169_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1925_c2_1169_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_1169_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_1169_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_1169_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1930_c3_e4b8 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_1169_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_4bdc_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_1169_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_1169_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_1169_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_1169_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_4bdc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_1169_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_1169_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1925_c2_1169_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1925_c2_1169_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1938_c7_4bdc_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1925_c2_1169_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1925_c2_1169_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1925_c2_1169_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1925_c2_1169_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1938_c7_4bdc_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1925_c2_1169_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1925_c2_1169_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_249c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_249c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_249c_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1938_c7_4bdc_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1938_c7_4bdc_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1941_c7_6c79_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1938_c7_4bdc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_4bdc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_4bdc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_6c79_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_4bdc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_4bdc_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1939_c3_bd90 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_4bdc_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_6c79_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_4bdc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_4bdc_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_4bdc_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_6c79_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_4bdc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_4bdc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_4bdc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_6c79_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_4bdc_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1938_c7_4bdc_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1938_c7_4bdc_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1941_c7_6c79_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1938_c7_4bdc_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1938_c7_4bdc_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1938_c7_4bdc_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1941_c7_6c79_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1938_c7_4bdc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_5957_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_5957_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_5957_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1941_c7_6c79_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1941_c7_6c79_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1946_c7_7be0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1941_c7_6c79_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_6c79_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_6c79_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_7be0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_6c79_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_6c79_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1944_c3_8ad1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_6c79_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_7be0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_6c79_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_6c79_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_6c79_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_7be0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_6c79_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_6c79_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_6c79_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_7be0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_6c79_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1941_c7_6c79_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1941_c7_6c79_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1946_c7_7be0_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1941_c7_6c79_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1941_c7_6c79_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1941_c7_6c79_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1946_c7_7be0_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1941_c7_6c79_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1946_c11_2981_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1946_c11_2981_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1946_c11_2981_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1946_c7_7be0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1946_c7_7be0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1950_c7_0e25_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1946_c7_7be0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_7be0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_7be0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_0e25_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_7be0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_7be0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1948_c3_4bfb : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_7be0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_0e25_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_7be0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_7be0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_7be0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_0e25_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_7be0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_7be0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_7be0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_0e25_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_7be0_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1946_c7_7be0_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1946_c7_7be0_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1950_c7_0e25_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1946_c7_7be0_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1946_c7_7be0_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1946_c7_7be0_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1946_c7_7be0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1947_c3_674d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1947_c3_674d_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1947_c3_674d_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1950_c11_8653_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1950_c11_8653_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1950_c11_8653_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1950_c7_0e25_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1950_c7_0e25_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1954_c7_d3c1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1950_c7_0e25_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_0e25_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_0e25_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_d3c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_0e25_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_0e25_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_0e25_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_d3c1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_0e25_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_0e25_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_0e25_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_d3c1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_0e25_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_0e25_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_0e25_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_d3c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_0e25_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1950_c7_0e25_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1950_c7_0e25_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1954_c7_d3c1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1950_c7_0e25_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_bf4d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_bf4d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_bf4d_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1954_c7_d3c1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1954_c7_d3c1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1954_c7_d3c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_d3c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_d3c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_d3c1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_d3c1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1958_c3_6473 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_d3c1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_d3c1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_d3c1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_d3c1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_d3c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_d3c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_d3c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_d3c1_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1954_c7_d3c1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1954_c7_d3c1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1954_c7_d3c1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1955_c3_141a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1955_c3_141a_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1955_c3_141a_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1956_c30_847b_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1956_c30_847b_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1956_c30_847b_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1956_c30_847b_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1959_c21_a212_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l1959_c21_947e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l1959_c21_947e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l1959_c21_947e_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1959_c21_a212_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1959_c21_a212_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1959_c21_a212_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1954_l1950_l1946_l1941_l1938_l1925_DUPLICATE_8e29_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1954_l1950_l1946_l1941_l1938_DUPLICATE_c009_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1954_l1950_l1946_l1941_l1938_DUPLICATE_1808_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1954_l1950_l1946_l1941_l1938_DUPLICATE_7c63_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1951_l1947_l1942_l1955_DUPLICATE_3ba7_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1943_l1952_DUPLICATE_962e_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1943_l1952_DUPLICATE_962e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1950_l1954_DUPLICATE_00a4_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_243c_uxn_opcodes_h_l1963_l1921_DUPLICATE_1960_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_bf4d_right := to_unsigned(5, 3);
     VAR_MUX_uxn_opcodes_h_l1959_c21_a212_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_MUX_uxn_opcodes_h_l1959_c21_a212_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1948_c3_4bfb := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_7be0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1948_c3_4bfb;
     VAR_sp_relative_shift_uxn_opcodes_h_l1956_c30_847b_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1950_c11_8653_right := to_unsigned(4, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_1169_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_d3c1_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_249c_right := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_1169_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1939_c3_bd90 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_4bdc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1939_c3_bd90;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1958_c3_6473 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_d3c1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1958_c3_6473;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_d3c1_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1930_c3_e4b8 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_1169_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1930_c3_e4b8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1946_c11_2981_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_1169_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c6_38e3_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1935_c3_f229 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_1169_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1935_c3_f229;
     VAR_sp_relative_shift_uxn_opcodes_h_l1956_c30_847b_y := resize(to_signed(-3, 3), 4);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_1169_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_1169_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1944_c3_8ad1 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_6c79_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1944_c3_8ad1;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_1169_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_5957_right := to_unsigned(2, 2);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_previous_stack_read := previous_stack_read;

     -- Submodule level 0
     VAR_sp_relative_shift_uxn_opcodes_h_l1956_c30_847b_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1955_c3_141a_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1925_c2_1169_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1938_c7_4bdc_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1941_c7_6c79_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1946_c7_7be0_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1954_c7_d3c1_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c6_38e3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_249c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_5957_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1946_c11_2981_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1950_c11_8653_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_bf4d_left := VAR_phase;
     VAR_BIN_OP_LT_uxn_opcodes_h_l1959_c21_947e_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1947_c3_674d_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1925_c2_1169_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1938_c7_4bdc_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1946_c7_7be0_iffalse := t16;
     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1950_l1954_DUPLICATE_00a4 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1950_l1954_DUPLICATE_00a4_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1954_l1950_l1946_l1941_l1938_DUPLICATE_1808 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1954_l1950_l1946_l1941_l1938_DUPLICATE_1808_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1946_c11_2981] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1946_c11_2981_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1946_c11_2981_left;
     BIN_OP_EQ_uxn_opcodes_h_l1946_c11_2981_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1946_c11_2981_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1946_c11_2981_return_output := BIN_OP_EQ_uxn_opcodes_h_l1946_c11_2981_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1954_c11_bf4d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1954_c11_bf4d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_bf4d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1954_c11_bf4d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_bf4d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_bf4d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1954_c11_bf4d_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1925_c2_1169] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1925_c2_1169_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l1925_c6_38e3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1925_c6_38e3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c6_38e3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1925_c6_38e3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c6_38e3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c6_38e3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1925_c6_38e3_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1956_c30_847b] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1956_c30_847b_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1956_c30_847b_ins;
     sp_relative_shift_uxn_opcodes_h_l1956_c30_847b_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1956_c30_847b_x;
     sp_relative_shift_uxn_opcodes_h_l1956_c30_847b_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1956_c30_847b_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1956_c30_847b_return_output := sp_relative_shift_uxn_opcodes_h_l1956_c30_847b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1954_l1950_l1946_l1941_l1938_DUPLICATE_c009 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1954_l1950_l1946_l1941_l1938_DUPLICATE_c009_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1954_l1950_l1946_l1941_l1938_DUPLICATE_7c63 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1954_l1950_l1946_l1941_l1938_DUPLICATE_7c63_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1954_l1950_l1946_l1941_l1938_l1925_DUPLICATE_8e29 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1954_l1950_l1946_l1941_l1938_l1925_DUPLICATE_8e29_return_output := result.u8_value;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1925_c2_1169] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1925_c2_1169_return_output := result.is_pc_updated;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1951_l1947_l1942_l1955_DUPLICATE_3ba7 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1951_l1947_l1942_l1955_DUPLICATE_3ba7_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1941_c11_5957] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1941_c11_5957_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_5957_left;
     BIN_OP_EQ_uxn_opcodes_h_l1941_c11_5957_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_5957_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_5957_return_output := BIN_OP_EQ_uxn_opcodes_h_l1941_c11_5957_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1925_c2_1169] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1925_c2_1169_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1950_c11_8653] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1950_c11_8653_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1950_c11_8653_left;
     BIN_OP_EQ_uxn_opcodes_h_l1950_c11_8653_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1950_c11_8653_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1950_c11_8653_return_output := BIN_OP_EQ_uxn_opcodes_h_l1950_c11_8653_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1925_c2_1169] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1925_c2_1169_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1938_c11_249c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1938_c11_249c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_249c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1938_c11_249c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_249c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_249c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1938_c11_249c_return_output;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1925_c2_1169_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c6_38e3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_1169_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c6_38e3_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_1169_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c6_38e3_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_1169_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c6_38e3_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_1169_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c6_38e3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_1169_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c6_38e3_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_1169_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c6_38e3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_1169_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c6_38e3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_1169_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c6_38e3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1925_c2_1169_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c6_38e3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1925_c2_1169_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c6_38e3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1938_c7_4bdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_249c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_4bdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_249c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_4bdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_249c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_4bdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_249c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_4bdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_249c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1938_c7_4bdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_249c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1938_c7_4bdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_249c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1941_c7_6c79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_5957_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_6c79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_5957_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_6c79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_5957_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_6c79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_5957_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_6c79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_5957_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1941_c7_6c79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_5957_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1941_c7_6c79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_5957_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1946_c7_7be0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1946_c11_2981_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_7be0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1946_c11_2981_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_7be0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1946_c11_2981_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_7be0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1946_c11_2981_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_7be0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1946_c11_2981_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1946_c7_7be0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1946_c11_2981_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1946_c7_7be0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1946_c11_2981_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1950_c7_0e25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1950_c11_8653_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_0e25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1950_c11_8653_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_0e25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1950_c11_8653_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_0e25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1950_c11_8653_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_0e25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1950_c11_8653_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1950_c7_0e25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1950_c11_8653_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1954_c7_d3c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_bf4d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_d3c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_bf4d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_d3c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_bf4d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_d3c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_bf4d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_d3c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_bf4d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1954_c7_d3c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_bf4d_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1947_c3_674d_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1951_l1947_l1942_l1955_DUPLICATE_3ba7_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1955_c3_141a_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1951_l1947_l1942_l1955_DUPLICATE_3ba7_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1943_l1952_DUPLICATE_962e_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1951_l1947_l1942_l1955_DUPLICATE_3ba7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_4bdc_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1954_l1950_l1946_l1941_l1938_DUPLICATE_1808_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_6c79_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1954_l1950_l1946_l1941_l1938_DUPLICATE_1808_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_7be0_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1954_l1950_l1946_l1941_l1938_DUPLICATE_1808_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_0e25_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1954_l1950_l1946_l1941_l1938_DUPLICATE_1808_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_d3c1_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1954_l1950_l1946_l1941_l1938_DUPLICATE_1808_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_4bdc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1954_l1950_l1946_l1941_l1938_DUPLICATE_7c63_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_6c79_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1954_l1950_l1946_l1941_l1938_DUPLICATE_7c63_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_7be0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1954_l1950_l1946_l1941_l1938_DUPLICATE_7c63_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_0e25_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1954_l1950_l1946_l1941_l1938_DUPLICATE_7c63_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_d3c1_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1954_l1950_l1946_l1941_l1938_DUPLICATE_7c63_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_4bdc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1954_l1950_l1946_l1941_l1938_DUPLICATE_c009_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_6c79_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1954_l1950_l1946_l1941_l1938_DUPLICATE_c009_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_7be0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1954_l1950_l1946_l1941_l1938_DUPLICATE_c009_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_0e25_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1954_l1950_l1946_l1941_l1938_DUPLICATE_c009_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_d3c1_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1954_l1950_l1946_l1941_l1938_DUPLICATE_c009_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_0e25_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1950_l1954_DUPLICATE_00a4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_d3c1_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1950_l1954_DUPLICATE_00a4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1925_c2_1169_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1954_l1950_l1946_l1941_l1938_l1925_DUPLICATE_8e29_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1938_c7_4bdc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1954_l1950_l1946_l1941_l1938_l1925_DUPLICATE_8e29_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1941_c7_6c79_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1954_l1950_l1946_l1941_l1938_l1925_DUPLICATE_8e29_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1946_c7_7be0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1954_l1950_l1946_l1941_l1938_l1925_DUPLICATE_8e29_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1950_c7_0e25_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1954_l1950_l1946_l1941_l1938_l1925_DUPLICATE_8e29_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1954_c7_d3c1_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1954_l1950_l1946_l1941_l1938_l1925_DUPLICATE_8e29_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_1169_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1925_c2_1169_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_1169_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1925_c2_1169_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_1169_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1925_c2_1169_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_1169_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1925_c2_1169_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_d3c1_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1956_c30_847b_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l1955_c3_141a] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1955_c3_141a_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1955_c3_141a_left;
     BIN_OP_OR_uxn_opcodes_h_l1955_c3_141a_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1955_c3_141a_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1955_c3_141a_return_output := BIN_OP_OR_uxn_opcodes_h_l1955_c3_141a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1954_c7_d3c1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_d3c1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_d3c1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_d3c1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_d3c1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_d3c1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_d3c1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_d3c1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_d3c1_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1925_c2_1169] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_1169_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_1169_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_1169_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_1169_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_1169_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_1169_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_1169_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_1169_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1947_c3_674d] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1947_c3_674d_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1947_c3_674d_left;
     BIN_OP_OR_uxn_opcodes_h_l1947_c3_674d_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1947_c3_674d_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1947_c3_674d_return_output := BIN_OP_OR_uxn_opcodes_h_l1947_c3_674d_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1925_c2_1169] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_1169_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_1169_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_1169_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_1169_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_1169_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_1169_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_1169_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_1169_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1954_c7_d3c1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_d3c1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_d3c1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_d3c1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_d3c1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_d3c1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_d3c1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_d3c1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_d3c1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1954_c7_d3c1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_d3c1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_d3c1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_d3c1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_d3c1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_d3c1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_d3c1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_d3c1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_d3c1_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1925_c2_1169] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_1169_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_1169_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_1169_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_1169_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_1169_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_1169_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_1169_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_1169_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1954_c7_d3c1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_d3c1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_d3c1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_d3c1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_d3c1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_d3c1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_d3c1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_d3c1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_d3c1_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1925_c2_1169] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_1169_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_1169_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_1169_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_1169_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_1169_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_1169_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_1169_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_1169_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1943_l1952_DUPLICATE_962e LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1943_l1952_DUPLICATE_962e_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1943_l1952_DUPLICATE_962e_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1943_l1952_DUPLICATE_962e_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1943_l1952_DUPLICATE_962e_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1946_c7_7be0_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1947_c3_674d_return_output;
     VAR_BIN_OP_LT_uxn_opcodes_h_l1959_c21_947e_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1955_c3_141a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1954_c7_d3c1_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1955_c3_141a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1950_c7_0e25_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1943_l1952_DUPLICATE_962e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1941_c7_6c79_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1943_l1952_DUPLICATE_962e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_0e25_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_d3c1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_0e25_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_d3c1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_0e25_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_d3c1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_0e25_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_d3c1_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1950_c7_0e25] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_0e25_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_0e25_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_0e25_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_0e25_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_0e25_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_0e25_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_0e25_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_0e25_return_output;

     -- t16_MUX[uxn_opcodes_h_l1946_c7_7be0] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1946_c7_7be0_cond <= VAR_t16_MUX_uxn_opcodes_h_l1946_c7_7be0_cond;
     t16_MUX_uxn_opcodes_h_l1946_c7_7be0_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1946_c7_7be0_iftrue;
     t16_MUX_uxn_opcodes_h_l1946_c7_7be0_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1946_c7_7be0_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1946_c7_7be0_return_output := t16_MUX_uxn_opcodes_h_l1946_c7_7be0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1950_c7_0e25] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_0e25_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_0e25_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_0e25_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_0e25_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_0e25_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_0e25_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_0e25_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_0e25_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1950_c7_0e25] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_0e25_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_0e25_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_0e25_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_0e25_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_0e25_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_0e25_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_0e25_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_0e25_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1950_c7_0e25] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_0e25_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_0e25_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_0e25_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_0e25_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_0e25_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_0e25_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_0e25_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_0e25_return_output;

     -- n16_MUX[uxn_opcodes_h_l1954_c7_d3c1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1954_c7_d3c1_cond <= VAR_n16_MUX_uxn_opcodes_h_l1954_c7_d3c1_cond;
     n16_MUX_uxn_opcodes_h_l1954_c7_d3c1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1954_c7_d3c1_iftrue;
     n16_MUX_uxn_opcodes_h_l1954_c7_d3c1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1954_c7_d3c1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1954_c7_d3c1_return_output := n16_MUX_uxn_opcodes_h_l1954_c7_d3c1_return_output;

     -- BIN_OP_LT[uxn_opcodes_h_l1959_c21_947e] LATENCY=0
     -- Inputs
     BIN_OP_LT_uxn_opcodes_h_l1959_c21_947e_left <= VAR_BIN_OP_LT_uxn_opcodes_h_l1959_c21_947e_left;
     BIN_OP_LT_uxn_opcodes_h_l1959_c21_947e_right <= VAR_BIN_OP_LT_uxn_opcodes_h_l1959_c21_947e_right;
     -- Outputs
     VAR_BIN_OP_LT_uxn_opcodes_h_l1959_c21_947e_return_output := BIN_OP_LT_uxn_opcodes_h_l1959_c21_947e_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1959_c21_a212_cond := VAR_BIN_OP_LT_uxn_opcodes_h_l1959_c21_947e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1950_c7_0e25_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1954_c7_d3c1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_7be0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_0e25_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_7be0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_0e25_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_7be0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_0e25_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_7be0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_0e25_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1941_c7_6c79_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1946_c7_7be0_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1946_c7_7be0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_7be0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_7be0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_7be0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_7be0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_7be0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_7be0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_7be0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_7be0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1946_c7_7be0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_7be0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_7be0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_7be0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_7be0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_7be0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_7be0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_7be0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_7be0_return_output;

     -- n16_MUX[uxn_opcodes_h_l1950_c7_0e25] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1950_c7_0e25_cond <= VAR_n16_MUX_uxn_opcodes_h_l1950_c7_0e25_cond;
     n16_MUX_uxn_opcodes_h_l1950_c7_0e25_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1950_c7_0e25_iftrue;
     n16_MUX_uxn_opcodes_h_l1950_c7_0e25_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1950_c7_0e25_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1950_c7_0e25_return_output := n16_MUX_uxn_opcodes_h_l1950_c7_0e25_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1946_c7_7be0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_7be0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_7be0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_7be0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_7be0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_7be0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_7be0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_7be0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_7be0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1946_c7_7be0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_7be0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_7be0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_7be0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_7be0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_7be0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_7be0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_7be0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_7be0_return_output;

     -- t16_MUX[uxn_opcodes_h_l1941_c7_6c79] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1941_c7_6c79_cond <= VAR_t16_MUX_uxn_opcodes_h_l1941_c7_6c79_cond;
     t16_MUX_uxn_opcodes_h_l1941_c7_6c79_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1941_c7_6c79_iftrue;
     t16_MUX_uxn_opcodes_h_l1941_c7_6c79_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1941_c7_6c79_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1941_c7_6c79_return_output := t16_MUX_uxn_opcodes_h_l1941_c7_6c79_return_output;

     -- MUX[uxn_opcodes_h_l1959_c21_a212] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1959_c21_a212_cond <= VAR_MUX_uxn_opcodes_h_l1959_c21_a212_cond;
     MUX_uxn_opcodes_h_l1959_c21_a212_iftrue <= VAR_MUX_uxn_opcodes_h_l1959_c21_a212_iftrue;
     MUX_uxn_opcodes_h_l1959_c21_a212_iffalse <= VAR_MUX_uxn_opcodes_h_l1959_c21_a212_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1959_c21_a212_return_output := MUX_uxn_opcodes_h_l1959_c21_a212_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1954_c7_d3c1_iftrue := VAR_MUX_uxn_opcodes_h_l1959_c21_a212_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1946_c7_7be0_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1950_c7_0e25_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_6c79_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_7be0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_6c79_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_7be0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_6c79_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_7be0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_6c79_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_7be0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1938_c7_4bdc_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1941_c7_6c79_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1954_c7_d3c1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1954_c7_d3c1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1954_c7_d3c1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1954_c7_d3c1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1954_c7_d3c1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1954_c7_d3c1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1954_c7_d3c1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1954_c7_d3c1_return_output := result_u8_value_MUX_uxn_opcodes_h_l1954_c7_d3c1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1941_c7_6c79] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_6c79_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_6c79_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_6c79_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_6c79_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_6c79_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_6c79_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_6c79_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_6c79_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1941_c7_6c79] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_6c79_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_6c79_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_6c79_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_6c79_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_6c79_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_6c79_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_6c79_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_6c79_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1941_c7_6c79] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_6c79_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_6c79_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_6c79_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_6c79_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_6c79_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_6c79_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_6c79_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_6c79_return_output;

     -- t16_MUX[uxn_opcodes_h_l1938_c7_4bdc] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1938_c7_4bdc_cond <= VAR_t16_MUX_uxn_opcodes_h_l1938_c7_4bdc_cond;
     t16_MUX_uxn_opcodes_h_l1938_c7_4bdc_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1938_c7_4bdc_iftrue;
     t16_MUX_uxn_opcodes_h_l1938_c7_4bdc_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1938_c7_4bdc_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1938_c7_4bdc_return_output := t16_MUX_uxn_opcodes_h_l1938_c7_4bdc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1941_c7_6c79] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_6c79_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_6c79_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_6c79_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_6c79_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_6c79_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_6c79_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_6c79_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_6c79_return_output;

     -- n16_MUX[uxn_opcodes_h_l1946_c7_7be0] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1946_c7_7be0_cond <= VAR_n16_MUX_uxn_opcodes_h_l1946_c7_7be0_cond;
     n16_MUX_uxn_opcodes_h_l1946_c7_7be0_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1946_c7_7be0_iftrue;
     n16_MUX_uxn_opcodes_h_l1946_c7_7be0_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1946_c7_7be0_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1946_c7_7be0_return_output := n16_MUX_uxn_opcodes_h_l1946_c7_7be0_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1941_c7_6c79_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1946_c7_7be0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_4bdc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_6c79_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_4bdc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_6c79_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_4bdc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_6c79_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_4bdc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_6c79_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1950_c7_0e25_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1954_c7_d3c1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1925_c2_1169_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1938_c7_4bdc_return_output;
     -- n16_MUX[uxn_opcodes_h_l1941_c7_6c79] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1941_c7_6c79_cond <= VAR_n16_MUX_uxn_opcodes_h_l1941_c7_6c79_cond;
     n16_MUX_uxn_opcodes_h_l1941_c7_6c79_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1941_c7_6c79_iftrue;
     n16_MUX_uxn_opcodes_h_l1941_c7_6c79_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1941_c7_6c79_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1941_c7_6c79_return_output := n16_MUX_uxn_opcodes_h_l1941_c7_6c79_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1938_c7_4bdc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_4bdc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_4bdc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_4bdc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_4bdc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_4bdc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_4bdc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_4bdc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_4bdc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1938_c7_4bdc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_4bdc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_4bdc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_4bdc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_4bdc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_4bdc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_4bdc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_4bdc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_4bdc_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1950_c7_0e25] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1950_c7_0e25_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1950_c7_0e25_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1950_c7_0e25_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1950_c7_0e25_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1950_c7_0e25_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1950_c7_0e25_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1950_c7_0e25_return_output := result_u8_value_MUX_uxn_opcodes_h_l1950_c7_0e25_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1938_c7_4bdc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_4bdc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_4bdc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_4bdc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_4bdc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_4bdc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_4bdc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_4bdc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_4bdc_return_output;

     -- t16_MUX[uxn_opcodes_h_l1925_c2_1169] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1925_c2_1169_cond <= VAR_t16_MUX_uxn_opcodes_h_l1925_c2_1169_cond;
     t16_MUX_uxn_opcodes_h_l1925_c2_1169_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1925_c2_1169_iftrue;
     t16_MUX_uxn_opcodes_h_l1925_c2_1169_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1925_c2_1169_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1925_c2_1169_return_output := t16_MUX_uxn_opcodes_h_l1925_c2_1169_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1938_c7_4bdc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_4bdc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_4bdc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_4bdc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_4bdc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_4bdc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_4bdc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_4bdc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_4bdc_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1938_c7_4bdc_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1941_c7_6c79_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_1169_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_4bdc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_1169_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_4bdc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_1169_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_4bdc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_1169_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_4bdc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1946_c7_7be0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1950_c7_0e25_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1925_c2_1169_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1946_c7_7be0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1946_c7_7be0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1946_c7_7be0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1946_c7_7be0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1946_c7_7be0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1946_c7_7be0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1946_c7_7be0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1946_c7_7be0_return_output := result_u8_value_MUX_uxn_opcodes_h_l1946_c7_7be0_return_output;

     -- n16_MUX[uxn_opcodes_h_l1938_c7_4bdc] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1938_c7_4bdc_cond <= VAR_n16_MUX_uxn_opcodes_h_l1938_c7_4bdc_cond;
     n16_MUX_uxn_opcodes_h_l1938_c7_4bdc_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1938_c7_4bdc_iftrue;
     n16_MUX_uxn_opcodes_h_l1938_c7_4bdc_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1938_c7_4bdc_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1938_c7_4bdc_return_output := n16_MUX_uxn_opcodes_h_l1938_c7_4bdc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1925_c2_1169] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_1169_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_1169_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_1169_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_1169_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_1169_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_1169_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_1169_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_1169_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1925_c2_1169] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_1169_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_1169_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_1169_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_1169_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_1169_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_1169_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_1169_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_1169_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1925_c2_1169] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_1169_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_1169_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_1169_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_1169_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_1169_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_1169_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_1169_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_1169_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1925_c2_1169] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_1169_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_1169_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_1169_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_1169_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_1169_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_1169_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_1169_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_1169_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1925_c2_1169_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1938_c7_4bdc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1941_c7_6c79_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1946_c7_7be0_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1941_c7_6c79] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1941_c7_6c79_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1941_c7_6c79_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1941_c7_6c79_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1941_c7_6c79_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1941_c7_6c79_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1941_c7_6c79_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1941_c7_6c79_return_output := result_u8_value_MUX_uxn_opcodes_h_l1941_c7_6c79_return_output;

     -- n16_MUX[uxn_opcodes_h_l1925_c2_1169] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1925_c2_1169_cond <= VAR_n16_MUX_uxn_opcodes_h_l1925_c2_1169_cond;
     n16_MUX_uxn_opcodes_h_l1925_c2_1169_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1925_c2_1169_iftrue;
     n16_MUX_uxn_opcodes_h_l1925_c2_1169_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1925_c2_1169_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1925_c2_1169_return_output := n16_MUX_uxn_opcodes_h_l1925_c2_1169_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1925_c2_1169_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1938_c7_4bdc_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1941_c7_6c79_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1938_c7_4bdc] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1938_c7_4bdc_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1938_c7_4bdc_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1938_c7_4bdc_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1938_c7_4bdc_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1938_c7_4bdc_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1938_c7_4bdc_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1938_c7_4bdc_return_output := result_u8_value_MUX_uxn_opcodes_h_l1938_c7_4bdc_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1925_c2_1169_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1938_c7_4bdc_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1925_c2_1169] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1925_c2_1169_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1925_c2_1169_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1925_c2_1169_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1925_c2_1169_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1925_c2_1169_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1925_c2_1169_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1925_c2_1169_return_output := result_u8_value_MUX_uxn_opcodes_h_l1925_c2_1169_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_243c_uxn_opcodes_h_l1963_l1921_DUPLICATE_1960 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_243c_uxn_opcodes_h_l1963_l1921_DUPLICATE_1960_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_243c(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1925_c2_1169_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_1169_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_1169_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_1169_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_1169_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_1169_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_1169_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_1169_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_1169_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_243c_uxn_opcodes_h_l1963_l1921_DUPLICATE_1960_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_243c_uxn_opcodes_h_l1963_l1921_DUPLICATE_1960_return_output;
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
