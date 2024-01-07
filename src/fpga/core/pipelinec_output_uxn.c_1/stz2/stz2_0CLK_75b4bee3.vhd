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
-- Submodules: 53
entity stz2_0CLK_75b4bee3 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end stz2_0CLK_75b4bee3;
architecture arch of stz2_0CLK_75b4bee3 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n16_low : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n16_high : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n16_low : unsigned(7 downto 0);
signal REG_COMB_n16_high : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1557_c6_89a7]
signal BIN_OP_EQ_uxn_opcodes_h_l1557_c6_89a7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1557_c6_89a7_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1557_c6_89a7_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1557_c2_d68c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_d68c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_d68c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_d68c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_d68c_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1557_c2_d68c]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_d68c_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_d68c_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_d68c_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_d68c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1557_c2_d68c]
signal result_u8_value_MUX_uxn_opcodes_h_l1557_c2_d68c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1557_c2_d68c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1557_c2_d68c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1557_c2_d68c_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1557_c2_d68c]
signal result_u16_value_MUX_uxn_opcodes_h_l1557_c2_d68c_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1557_c2_d68c_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1557_c2_d68c_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1557_c2_d68c_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1557_c2_d68c]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_d68c_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_d68c_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_d68c_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_d68c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1557_c2_d68c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_d68c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_d68c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_d68c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_d68c_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1557_c2_d68c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_d68c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_d68c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_d68c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_d68c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1557_c2_d68c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_d68c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_d68c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_d68c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_d68c_return_output : unsigned(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1557_c2_d68c]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_d68c_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_d68c_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_d68c_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_d68c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1557_c2_d68c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_d68c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_d68c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_d68c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_d68c_return_output : unsigned(0 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1557_c2_d68c]
signal n16_high_MUX_uxn_opcodes_h_l1557_c2_d68c_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1557_c2_d68c_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1557_c2_d68c_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1557_c2_d68c_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1557_c2_d68c]
signal n16_low_MUX_uxn_opcodes_h_l1557_c2_d68c_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1557_c2_d68c_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1557_c2_d68c_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1557_c2_d68c_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1557_c2_d68c]
signal t8_MUX_uxn_opcodes_h_l1557_c2_d68c_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1557_c2_d68c_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1557_c2_d68c_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1557_c2_d68c_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1570_c11_d921]
signal BIN_OP_EQ_uxn_opcodes_h_l1570_c11_d921_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1570_c11_d921_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1570_c11_d921_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1570_c7_cdf3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_cdf3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_cdf3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_cdf3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_cdf3_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1570_c7_cdf3]
signal result_u8_value_MUX_uxn_opcodes_h_l1570_c7_cdf3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1570_c7_cdf3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1570_c7_cdf3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1570_c7_cdf3_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1570_c7_cdf3]
signal result_u16_value_MUX_uxn_opcodes_h_l1570_c7_cdf3_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1570_c7_cdf3_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1570_c7_cdf3_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1570_c7_cdf3_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1570_c7_cdf3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_cdf3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_cdf3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_cdf3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_cdf3_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1570_c7_cdf3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_cdf3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_cdf3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_cdf3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_cdf3_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1570_c7_cdf3]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_cdf3_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_cdf3_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_cdf3_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_cdf3_return_output : unsigned(0 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1570_c7_cdf3]
signal n16_high_MUX_uxn_opcodes_h_l1570_c7_cdf3_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1570_c7_cdf3_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1570_c7_cdf3_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1570_c7_cdf3_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1570_c7_cdf3]
signal n16_low_MUX_uxn_opcodes_h_l1570_c7_cdf3_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1570_c7_cdf3_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1570_c7_cdf3_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1570_c7_cdf3_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1570_c7_cdf3]
signal t8_MUX_uxn_opcodes_h_l1570_c7_cdf3_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1570_c7_cdf3_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1570_c7_cdf3_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1570_c7_cdf3_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1573_c11_f817]
signal BIN_OP_EQ_uxn_opcodes_h_l1573_c11_f817_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1573_c11_f817_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1573_c11_f817_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1573_c7_4406]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_4406_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_4406_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_4406_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_4406_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1573_c7_4406]
signal result_u8_value_MUX_uxn_opcodes_h_l1573_c7_4406_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1573_c7_4406_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1573_c7_4406_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1573_c7_4406_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1573_c7_4406]
signal result_u16_value_MUX_uxn_opcodes_h_l1573_c7_4406_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1573_c7_4406_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1573_c7_4406_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1573_c7_4406_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1573_c7_4406]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_4406_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_4406_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_4406_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_4406_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1573_c7_4406]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_4406_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_4406_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_4406_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_4406_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1573_c7_4406]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_4406_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_4406_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_4406_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_4406_return_output : unsigned(0 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1573_c7_4406]
signal n16_high_MUX_uxn_opcodes_h_l1573_c7_4406_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1573_c7_4406_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1573_c7_4406_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1573_c7_4406_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1573_c7_4406]
signal n16_low_MUX_uxn_opcodes_h_l1573_c7_4406_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1573_c7_4406_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1573_c7_4406_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1573_c7_4406_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1573_c7_4406]
signal t8_MUX_uxn_opcodes_h_l1573_c7_4406_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1573_c7_4406_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1573_c7_4406_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1573_c7_4406_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1577_c11_1c75]
signal BIN_OP_EQ_uxn_opcodes_h_l1577_c11_1c75_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1577_c11_1c75_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1577_c11_1c75_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1577_c7_06ae]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_06ae_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_06ae_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_06ae_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_06ae_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1577_c7_06ae]
signal result_u8_value_MUX_uxn_opcodes_h_l1577_c7_06ae_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1577_c7_06ae_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1577_c7_06ae_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1577_c7_06ae_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1577_c7_06ae]
signal result_u16_value_MUX_uxn_opcodes_h_l1577_c7_06ae_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1577_c7_06ae_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1577_c7_06ae_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1577_c7_06ae_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1577_c7_06ae]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_06ae_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_06ae_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_06ae_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_06ae_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1577_c7_06ae]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_06ae_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_06ae_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_06ae_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_06ae_return_output : unsigned(0 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1577_c7_06ae]
signal n16_high_MUX_uxn_opcodes_h_l1577_c7_06ae_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1577_c7_06ae_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1577_c7_06ae_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1577_c7_06ae_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1577_c7_06ae]
signal n16_low_MUX_uxn_opcodes_h_l1577_c7_06ae_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1577_c7_06ae_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1577_c7_06ae_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1577_c7_06ae_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1579_c30_8268]
signal sp_relative_shift_uxn_opcodes_h_l1579_c30_8268_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1579_c30_8268_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1579_c30_8268_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1579_c30_8268_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1584_c11_101e]
signal BIN_OP_EQ_uxn_opcodes_h_l1584_c11_101e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1584_c11_101e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1584_c11_101e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1584_c7_9c0e]
signal result_u8_value_MUX_uxn_opcodes_h_l1584_c7_9c0e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1584_c7_9c0e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1584_c7_9c0e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1584_c7_9c0e_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1584_c7_9c0e]
signal result_u16_value_MUX_uxn_opcodes_h_l1584_c7_9c0e_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1584_c7_9c0e_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1584_c7_9c0e_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1584_c7_9c0e_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1584_c7_9c0e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_9c0e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_9c0e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_9c0e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_9c0e_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1584_c7_9c0e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_9c0e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_9c0e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_9c0e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_9c0e_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1584_c7_9c0e]
signal n16_low_MUX_uxn_opcodes_h_l1584_c7_9c0e_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1584_c7_9c0e_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1584_c7_9c0e_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1584_c7_9c0e_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1587_c33_afb0]
signal BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_afb0_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_afb0_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_afb0_return_output : unsigned(8 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CAST_TO_uint16_t_uint9_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(8 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_500b( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_pc_updated := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.u8_value := ref_toks_3;
      base.u16_value := ref_toks_4;
      base.is_ram_write := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_stack_write := ref_toks_7;
      base.stack_address_sp_offset := ref_toks_8;
      base.is_stack_index_flipped := ref_toks_9;
      base.is_opc_done := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1557_c6_89a7
BIN_OP_EQ_uxn_opcodes_h_l1557_c6_89a7 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1557_c6_89a7_left,
BIN_OP_EQ_uxn_opcodes_h_l1557_c6_89a7_right,
BIN_OP_EQ_uxn_opcodes_h_l1557_c6_89a7_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_d68c
result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_d68c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_d68c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_d68c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_d68c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_d68c_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_d68c
result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_d68c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_d68c_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_d68c_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_d68c_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_d68c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1557_c2_d68c
result_u8_value_MUX_uxn_opcodes_h_l1557_c2_d68c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1557_c2_d68c_cond,
result_u8_value_MUX_uxn_opcodes_h_l1557_c2_d68c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1557_c2_d68c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1557_c2_d68c_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1557_c2_d68c
result_u16_value_MUX_uxn_opcodes_h_l1557_c2_d68c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1557_c2_d68c_cond,
result_u16_value_MUX_uxn_opcodes_h_l1557_c2_d68c_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1557_c2_d68c_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1557_c2_d68c_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_d68c
result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_d68c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_d68c_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_d68c_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_d68c_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_d68c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_d68c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_d68c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_d68c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_d68c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_d68c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_d68c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_d68c
result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_d68c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_d68c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_d68c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_d68c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_d68c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_d68c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_d68c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_d68c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_d68c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_d68c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_d68c_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_d68c
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_d68c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_d68c_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_d68c_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_d68c_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_d68c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_d68c
result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_d68c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_d68c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_d68c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_d68c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_d68c_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1557_c2_d68c
n16_high_MUX_uxn_opcodes_h_l1557_c2_d68c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1557_c2_d68c_cond,
n16_high_MUX_uxn_opcodes_h_l1557_c2_d68c_iftrue,
n16_high_MUX_uxn_opcodes_h_l1557_c2_d68c_iffalse,
n16_high_MUX_uxn_opcodes_h_l1557_c2_d68c_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1557_c2_d68c
n16_low_MUX_uxn_opcodes_h_l1557_c2_d68c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1557_c2_d68c_cond,
n16_low_MUX_uxn_opcodes_h_l1557_c2_d68c_iftrue,
n16_low_MUX_uxn_opcodes_h_l1557_c2_d68c_iffalse,
n16_low_MUX_uxn_opcodes_h_l1557_c2_d68c_return_output);

-- t8_MUX_uxn_opcodes_h_l1557_c2_d68c
t8_MUX_uxn_opcodes_h_l1557_c2_d68c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1557_c2_d68c_cond,
t8_MUX_uxn_opcodes_h_l1557_c2_d68c_iftrue,
t8_MUX_uxn_opcodes_h_l1557_c2_d68c_iffalse,
t8_MUX_uxn_opcodes_h_l1557_c2_d68c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1570_c11_d921
BIN_OP_EQ_uxn_opcodes_h_l1570_c11_d921 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1570_c11_d921_left,
BIN_OP_EQ_uxn_opcodes_h_l1570_c11_d921_right,
BIN_OP_EQ_uxn_opcodes_h_l1570_c11_d921_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_cdf3
result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_cdf3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_cdf3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_cdf3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_cdf3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_cdf3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1570_c7_cdf3
result_u8_value_MUX_uxn_opcodes_h_l1570_c7_cdf3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1570_c7_cdf3_cond,
result_u8_value_MUX_uxn_opcodes_h_l1570_c7_cdf3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1570_c7_cdf3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1570_c7_cdf3_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1570_c7_cdf3
result_u16_value_MUX_uxn_opcodes_h_l1570_c7_cdf3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1570_c7_cdf3_cond,
result_u16_value_MUX_uxn_opcodes_h_l1570_c7_cdf3_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1570_c7_cdf3_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1570_c7_cdf3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_cdf3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_cdf3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_cdf3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_cdf3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_cdf3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_cdf3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_cdf3
result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_cdf3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_cdf3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_cdf3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_cdf3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_cdf3_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_cdf3
result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_cdf3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_cdf3_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_cdf3_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_cdf3_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_cdf3_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1570_c7_cdf3
n16_high_MUX_uxn_opcodes_h_l1570_c7_cdf3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1570_c7_cdf3_cond,
n16_high_MUX_uxn_opcodes_h_l1570_c7_cdf3_iftrue,
n16_high_MUX_uxn_opcodes_h_l1570_c7_cdf3_iffalse,
n16_high_MUX_uxn_opcodes_h_l1570_c7_cdf3_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1570_c7_cdf3
n16_low_MUX_uxn_opcodes_h_l1570_c7_cdf3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1570_c7_cdf3_cond,
n16_low_MUX_uxn_opcodes_h_l1570_c7_cdf3_iftrue,
n16_low_MUX_uxn_opcodes_h_l1570_c7_cdf3_iffalse,
n16_low_MUX_uxn_opcodes_h_l1570_c7_cdf3_return_output);

-- t8_MUX_uxn_opcodes_h_l1570_c7_cdf3
t8_MUX_uxn_opcodes_h_l1570_c7_cdf3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1570_c7_cdf3_cond,
t8_MUX_uxn_opcodes_h_l1570_c7_cdf3_iftrue,
t8_MUX_uxn_opcodes_h_l1570_c7_cdf3_iffalse,
t8_MUX_uxn_opcodes_h_l1570_c7_cdf3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1573_c11_f817
BIN_OP_EQ_uxn_opcodes_h_l1573_c11_f817 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1573_c11_f817_left,
BIN_OP_EQ_uxn_opcodes_h_l1573_c11_f817_right,
BIN_OP_EQ_uxn_opcodes_h_l1573_c11_f817_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_4406
result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_4406 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_4406_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_4406_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_4406_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_4406_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1573_c7_4406
result_u8_value_MUX_uxn_opcodes_h_l1573_c7_4406 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1573_c7_4406_cond,
result_u8_value_MUX_uxn_opcodes_h_l1573_c7_4406_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1573_c7_4406_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1573_c7_4406_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1573_c7_4406
result_u16_value_MUX_uxn_opcodes_h_l1573_c7_4406 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1573_c7_4406_cond,
result_u16_value_MUX_uxn_opcodes_h_l1573_c7_4406_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1573_c7_4406_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1573_c7_4406_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_4406
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_4406 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_4406_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_4406_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_4406_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_4406_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_4406
result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_4406 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_4406_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_4406_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_4406_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_4406_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_4406
result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_4406 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_4406_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_4406_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_4406_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_4406_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1573_c7_4406
n16_high_MUX_uxn_opcodes_h_l1573_c7_4406 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1573_c7_4406_cond,
n16_high_MUX_uxn_opcodes_h_l1573_c7_4406_iftrue,
n16_high_MUX_uxn_opcodes_h_l1573_c7_4406_iffalse,
n16_high_MUX_uxn_opcodes_h_l1573_c7_4406_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1573_c7_4406
n16_low_MUX_uxn_opcodes_h_l1573_c7_4406 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1573_c7_4406_cond,
n16_low_MUX_uxn_opcodes_h_l1573_c7_4406_iftrue,
n16_low_MUX_uxn_opcodes_h_l1573_c7_4406_iffalse,
n16_low_MUX_uxn_opcodes_h_l1573_c7_4406_return_output);

-- t8_MUX_uxn_opcodes_h_l1573_c7_4406
t8_MUX_uxn_opcodes_h_l1573_c7_4406 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1573_c7_4406_cond,
t8_MUX_uxn_opcodes_h_l1573_c7_4406_iftrue,
t8_MUX_uxn_opcodes_h_l1573_c7_4406_iffalse,
t8_MUX_uxn_opcodes_h_l1573_c7_4406_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1577_c11_1c75
BIN_OP_EQ_uxn_opcodes_h_l1577_c11_1c75 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1577_c11_1c75_left,
BIN_OP_EQ_uxn_opcodes_h_l1577_c11_1c75_right,
BIN_OP_EQ_uxn_opcodes_h_l1577_c11_1c75_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_06ae
result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_06ae : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_06ae_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_06ae_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_06ae_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_06ae_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1577_c7_06ae
result_u8_value_MUX_uxn_opcodes_h_l1577_c7_06ae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1577_c7_06ae_cond,
result_u8_value_MUX_uxn_opcodes_h_l1577_c7_06ae_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1577_c7_06ae_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1577_c7_06ae_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1577_c7_06ae
result_u16_value_MUX_uxn_opcodes_h_l1577_c7_06ae : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1577_c7_06ae_cond,
result_u16_value_MUX_uxn_opcodes_h_l1577_c7_06ae_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1577_c7_06ae_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1577_c7_06ae_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_06ae
result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_06ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_06ae_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_06ae_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_06ae_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_06ae_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_06ae
result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_06ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_06ae_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_06ae_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_06ae_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_06ae_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1577_c7_06ae
n16_high_MUX_uxn_opcodes_h_l1577_c7_06ae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1577_c7_06ae_cond,
n16_high_MUX_uxn_opcodes_h_l1577_c7_06ae_iftrue,
n16_high_MUX_uxn_opcodes_h_l1577_c7_06ae_iffalse,
n16_high_MUX_uxn_opcodes_h_l1577_c7_06ae_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1577_c7_06ae
n16_low_MUX_uxn_opcodes_h_l1577_c7_06ae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1577_c7_06ae_cond,
n16_low_MUX_uxn_opcodes_h_l1577_c7_06ae_iftrue,
n16_low_MUX_uxn_opcodes_h_l1577_c7_06ae_iffalse,
n16_low_MUX_uxn_opcodes_h_l1577_c7_06ae_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1579_c30_8268
sp_relative_shift_uxn_opcodes_h_l1579_c30_8268 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1579_c30_8268_ins,
sp_relative_shift_uxn_opcodes_h_l1579_c30_8268_x,
sp_relative_shift_uxn_opcodes_h_l1579_c30_8268_y,
sp_relative_shift_uxn_opcodes_h_l1579_c30_8268_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1584_c11_101e
BIN_OP_EQ_uxn_opcodes_h_l1584_c11_101e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1584_c11_101e_left,
BIN_OP_EQ_uxn_opcodes_h_l1584_c11_101e_right,
BIN_OP_EQ_uxn_opcodes_h_l1584_c11_101e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1584_c7_9c0e
result_u8_value_MUX_uxn_opcodes_h_l1584_c7_9c0e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1584_c7_9c0e_cond,
result_u8_value_MUX_uxn_opcodes_h_l1584_c7_9c0e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1584_c7_9c0e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1584_c7_9c0e_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1584_c7_9c0e
result_u16_value_MUX_uxn_opcodes_h_l1584_c7_9c0e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1584_c7_9c0e_cond,
result_u16_value_MUX_uxn_opcodes_h_l1584_c7_9c0e_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1584_c7_9c0e_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1584_c7_9c0e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_9c0e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_9c0e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_9c0e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_9c0e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_9c0e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_9c0e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_9c0e
result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_9c0e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_9c0e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_9c0e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_9c0e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_9c0e_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1584_c7_9c0e
n16_low_MUX_uxn_opcodes_h_l1584_c7_9c0e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1584_c7_9c0e_cond,
n16_low_MUX_uxn_opcodes_h_l1584_c7_9c0e_iftrue,
n16_low_MUX_uxn_opcodes_h_l1584_c7_9c0e_iffalse,
n16_low_MUX_uxn_opcodes_h_l1584_c7_9c0e_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_afb0
BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_afb0 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_afb0_left,
BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_afb0_right,
BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_afb0_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t8,
 n16_low,
 n16_high,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1557_c6_89a7_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_d68c_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_d68c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1557_c2_d68c_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1557_c2_d68c_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_d68c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_d68c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_d68c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_d68c_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_d68c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_d68c_return_output,
 n16_high_MUX_uxn_opcodes_h_l1557_c2_d68c_return_output,
 n16_low_MUX_uxn_opcodes_h_l1557_c2_d68c_return_output,
 t8_MUX_uxn_opcodes_h_l1557_c2_d68c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1570_c11_d921_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_cdf3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1570_c7_cdf3_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1570_c7_cdf3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_cdf3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_cdf3_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_cdf3_return_output,
 n16_high_MUX_uxn_opcodes_h_l1570_c7_cdf3_return_output,
 n16_low_MUX_uxn_opcodes_h_l1570_c7_cdf3_return_output,
 t8_MUX_uxn_opcodes_h_l1570_c7_cdf3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1573_c11_f817_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_4406_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1573_c7_4406_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1573_c7_4406_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_4406_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_4406_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_4406_return_output,
 n16_high_MUX_uxn_opcodes_h_l1573_c7_4406_return_output,
 n16_low_MUX_uxn_opcodes_h_l1573_c7_4406_return_output,
 t8_MUX_uxn_opcodes_h_l1573_c7_4406_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1577_c11_1c75_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_06ae_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1577_c7_06ae_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1577_c7_06ae_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_06ae_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_06ae_return_output,
 n16_high_MUX_uxn_opcodes_h_l1577_c7_06ae_return_output,
 n16_low_MUX_uxn_opcodes_h_l1577_c7_06ae_return_output,
 sp_relative_shift_uxn_opcodes_h_l1579_c30_8268_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1584_c11_101e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1584_c7_9c0e_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1584_c7_9c0e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_9c0e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_9c0e_return_output,
 n16_low_MUX_uxn_opcodes_h_l1584_c7_9c0e_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_afb0_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_89a7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_89a7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_89a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_d68c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_d68c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1557_c2_d68c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_d68c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_d68c_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_d68c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_d68c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1557_c2_d68c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_d68c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_d68c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1557_c2_d68c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1557_c2_d68c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1570_c7_cdf3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1557_c2_d68c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1557_c2_d68c_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1557_c2_d68c_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1557_c2_d68c_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1570_c7_cdf3_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1557_c2_d68c_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1557_c2_d68c_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_d68c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_d68c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_cdf3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_d68c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_d68c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_d68c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1562_c3_8e88 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_d68c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_cdf3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_d68c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_d68c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_d68c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_d68c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1557_c2_d68c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_d68c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_d68c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_d68c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1567_c3_b3f3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_d68c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_cdf3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_d68c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_d68c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_d68c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_d68c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1557_c2_d68c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_d68c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_d68c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_d68c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_d68c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_cdf3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_d68c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_d68c_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1557_c2_d68c_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1557_c2_d68c_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1570_c7_cdf3_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1557_c2_d68c_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1557_c2_d68c_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1557_c2_d68c_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1557_c2_d68c_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1570_c7_cdf3_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1557_c2_d68c_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1557_c2_d68c_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1557_c2_d68c_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1557_c2_d68c_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1570_c7_cdf3_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1557_c2_d68c_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1557_c2_d68c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_d921_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_d921_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_d921_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_cdf3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_cdf3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_4406_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_cdf3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1570_c7_cdf3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1570_c7_cdf3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1573_c7_4406_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1570_c7_cdf3_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1570_c7_cdf3_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1570_c7_cdf3_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1573_c7_4406_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1570_c7_cdf3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_cdf3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1571_c3_9005 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_cdf3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_4406_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_cdf3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_cdf3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_cdf3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_4406_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_cdf3_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_cdf3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_cdf3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_4406_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_cdf3_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1570_c7_cdf3_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1570_c7_cdf3_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1573_c7_4406_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1570_c7_cdf3_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1570_c7_cdf3_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1570_c7_cdf3_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1573_c7_4406_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1570_c7_cdf3_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1570_c7_cdf3_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1570_c7_cdf3_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1573_c7_4406_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1570_c7_cdf3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_f817_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_f817_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_f817_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_4406_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_4406_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_06ae_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_4406_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1573_c7_4406_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1573_c7_4406_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1577_c7_06ae_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1573_c7_4406_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1573_c7_4406_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1573_c7_4406_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1577_c7_06ae_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1573_c7_4406_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_4406_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1575_c3_1ac7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_4406_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1573_c7_4406_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_4406_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_4406_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_4406_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_06ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_4406_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_4406_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_4406_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_06ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_4406_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1573_c7_4406_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1573_c7_4406_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1577_c7_06ae_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1573_c7_4406_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1573_c7_4406_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1573_c7_4406_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1577_c7_06ae_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1573_c7_4406_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1573_c7_4406_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1573_c7_4406_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1573_c7_4406_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1577_c11_1c75_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1577_c11_1c75_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1577_c11_1c75_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_06ae_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_06ae_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_9c0e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_06ae_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1577_c7_06ae_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1577_c7_06ae_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1584_c7_9c0e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1577_c7_06ae_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1577_c7_06ae_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1577_c7_06ae_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1584_c7_9c0e_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1577_c7_06ae_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_06ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_06ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_9c0e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_06ae_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_06ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_06ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_06ae_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1577_c7_06ae_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1577_c7_06ae_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1577_c7_06ae_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1577_c7_06ae_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1577_c7_06ae_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1584_c7_9c0e_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1577_c7_06ae_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1579_c30_8268_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1579_c30_8268_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1579_c30_8268_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1579_c30_8268_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1581_c22_9ed5_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_101e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_101e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_101e_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1584_c7_9c0e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1584_c7_9c0e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1584_c7_9c0e_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1584_c7_9c0e_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1584_c7_9c0e_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1584_c7_9c0e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_9c0e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1586_c3_7bbb : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_9c0e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_9c0e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_9c0e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_9c0e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_9c0e_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1584_c7_9c0e_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1584_c7_9c0e_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1584_c7_9c0e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_afb0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_afb0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_afb0_return_output : unsigned(8 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1587_c22_19c2_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1573_l1557_l1570_l1584_DUPLICATE_7c2a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1573_l1557_l1570_l1584_DUPLICATE_bc69_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1573_l1570_l1584_DUPLICATE_0a11_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1573_l1577_l1570_l1584_DUPLICATE_fd40_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1573_l1577_l1570_DUPLICATE_4265_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_500b_uxn_opcodes_h_l1592_l1552_DUPLICATE_fcb0_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n16_low : unsigned(7 downto 0);
variable REG_VAR_n16_high : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n16_low := n16_low;
  REG_VAR_n16_high := n16_high;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_sp_relative_shift_uxn_opcodes_h_l1579_c30_8268_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_d68c_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1562_c3_8e88 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_d68c_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1562_c3_8e88;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_f817_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_89a7_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1567_c3_b3f3 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_d68c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1567_c3_b3f3;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1575_c3_1ac7 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_4406_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1575_c3_1ac7;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_d68c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_d921_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1577_c11_1c75_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_9c0e_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1579_c30_8268_y := resize(to_signed(-3, 3), 4);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_06ae_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_d68c_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_d68c_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1586_c3_7bbb := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_9c0e_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1586_c3_7bbb;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_d68c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_101e_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1571_c3_9005 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_cdf3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1571_c3_9005;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_afb0_right := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_d68c_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1579_c30_8268_ins := VAR_ins;
     VAR_n16_high_MUX_uxn_opcodes_h_l1557_c2_d68c_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l1570_c7_cdf3_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l1573_c7_4406_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l1577_c7_06ae_iffalse := n16_high;
     VAR_n16_low_MUX_uxn_opcodes_h_l1557_c2_d68c_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1570_c7_cdf3_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1573_c7_4406_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1577_c7_06ae_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1584_c7_9c0e_iffalse := n16_low;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_89a7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_d921_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_f817_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1577_c11_1c75_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_101e_left := VAR_phase;
     VAR_n16_high_MUX_uxn_opcodes_h_l1577_c7_06ae_iftrue := VAR_previous_stack_read;
     VAR_n16_low_MUX_uxn_opcodes_h_l1584_c7_9c0e_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1577_c7_06ae_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1584_c7_9c0e_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1573_c7_4406_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_afb0_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1557_c2_d68c_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1570_c7_cdf3_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1573_c7_4406_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l1570_c11_d921] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1570_c11_d921_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_d921_left;
     BIN_OP_EQ_uxn_opcodes_h_l1570_c11_d921_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_d921_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_d921_return_output := BIN_OP_EQ_uxn_opcodes_h_l1570_c11_d921_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1584_c11_101e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1584_c11_101e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_101e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1584_c11_101e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_101e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_101e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1584_c11_101e_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1573_c7_4406] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1573_c7_4406_return_output := result.stack_address_sp_offset;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1557_c2_d68c] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1557_c2_d68c_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1573_l1570_l1584_DUPLICATE_0a11 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1573_l1570_l1584_DUPLICATE_0a11_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1573_c11_f817] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1573_c11_f817_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_f817_left;
     BIN_OP_EQ_uxn_opcodes_h_l1573_c11_f817_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_f817_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_f817_return_output := BIN_OP_EQ_uxn_opcodes_h_l1573_c11_f817_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1577_c11_1c75] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1577_c11_1c75_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1577_c11_1c75_left;
     BIN_OP_EQ_uxn_opcodes_h_l1577_c11_1c75_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1577_c11_1c75_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1577_c11_1c75_return_output := BIN_OP_EQ_uxn_opcodes_h_l1577_c11_1c75_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1579_c30_8268] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1579_c30_8268_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1579_c30_8268_ins;
     sp_relative_shift_uxn_opcodes_h_l1579_c30_8268_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1579_c30_8268_x;
     sp_relative_shift_uxn_opcodes_h_l1579_c30_8268_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1579_c30_8268_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1579_c30_8268_return_output := sp_relative_shift_uxn_opcodes_h_l1579_c30_8268_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1573_l1557_l1570_l1584_DUPLICATE_7c2a LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1573_l1557_l1570_l1584_DUPLICATE_7c2a_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1573_l1577_l1570_DUPLICATE_4265 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1573_l1577_l1570_DUPLICATE_4265_return_output := result.is_ram_write;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1581_c22_9ed5] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1581_c22_9ed5_return_output := CAST_TO_uint16_t_uint8_t(
     t8);

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l1557_c2_d68c] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1557_c2_d68c_return_output := result.is_stack_write;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1587_c33_afb0] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_afb0_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_afb0_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_afb0_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_afb0_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_afb0_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_afb0_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1573_l1557_l1570_l1584_DUPLICATE_bc69 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1573_l1557_l1570_l1584_DUPLICATE_bc69_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1557_c6_89a7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1557_c6_89a7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_89a7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1557_c6_89a7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_89a7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_89a7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1557_c6_89a7_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1557_c2_d68c] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1557_c2_d68c_return_output := result.is_pc_updated;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1557_c2_d68c] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1557_c2_d68c_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1573_l1577_l1570_l1584_DUPLICATE_fd40 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1573_l1577_l1570_l1584_DUPLICATE_fd40_return_output := result.is_opc_done;

     -- Submodule level 1
     VAR_n16_high_MUX_uxn_opcodes_h_l1557_c2_d68c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_89a7_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1557_c2_d68c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_89a7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_d68c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_89a7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_d68c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_89a7_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_d68c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_89a7_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_d68c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_89a7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_d68c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_89a7_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_d68c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_89a7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_d68c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_89a7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_d68c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_89a7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1557_c2_d68c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_89a7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1557_c2_d68c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_89a7_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1557_c2_d68c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_89a7_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l1570_c7_cdf3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_d921_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1570_c7_cdf3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_d921_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_cdf3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_d921_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_cdf3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_d921_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_cdf3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_d921_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_cdf3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_d921_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1570_c7_cdf3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_d921_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1570_c7_cdf3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_d921_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1570_c7_cdf3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_d921_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l1573_c7_4406_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_f817_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1573_c7_4406_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_f817_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_4406_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_f817_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_4406_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_f817_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_4406_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_f817_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_4406_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_f817_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1573_c7_4406_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_f817_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1573_c7_4406_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_f817_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1573_c7_4406_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_f817_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l1577_c7_06ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1577_c11_1c75_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1577_c7_06ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1577_c11_1c75_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_06ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1577_c11_1c75_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_06ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1577_c11_1c75_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_06ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1577_c11_1c75_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1577_c7_06ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1577_c11_1c75_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1577_c7_06ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1577_c11_1c75_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1584_c7_9c0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_101e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_9c0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_101e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_9c0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_101e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1584_c7_9c0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_101e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1584_c7_9c0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_101e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1577_c7_06ae_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1581_c22_9ed5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_cdf3_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1573_l1570_l1584_DUPLICATE_0a11_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_4406_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1573_l1570_l1584_DUPLICATE_0a11_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_9c0e_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1573_l1570_l1584_DUPLICATE_0a11_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1557_c2_d68c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1573_l1557_l1570_l1584_DUPLICATE_bc69_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1570_c7_cdf3_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1573_l1557_l1570_l1584_DUPLICATE_bc69_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1573_c7_4406_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1573_l1557_l1570_l1584_DUPLICATE_bc69_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1584_c7_9c0e_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1573_l1557_l1570_l1584_DUPLICATE_bc69_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_cdf3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1573_l1577_l1570_l1584_DUPLICATE_fd40_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_4406_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1573_l1577_l1570_l1584_DUPLICATE_fd40_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_06ae_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1573_l1577_l1570_l1584_DUPLICATE_fd40_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_9c0e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1573_l1577_l1570_l1584_DUPLICATE_fd40_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_cdf3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1573_l1577_l1570_DUPLICATE_4265_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_4406_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1573_l1577_l1570_DUPLICATE_4265_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_06ae_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1573_l1577_l1570_DUPLICATE_4265_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1557_c2_d68c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1573_l1557_l1570_l1584_DUPLICATE_7c2a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1570_c7_cdf3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1573_l1557_l1570_l1584_DUPLICATE_7c2a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1573_c7_4406_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1573_l1557_l1570_l1584_DUPLICATE_7c2a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1584_c7_9c0e_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1573_l1557_l1570_l1584_DUPLICATE_7c2a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_d68c_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1557_c2_d68c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_d68c_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1557_c2_d68c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_d68c_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1557_c2_d68c_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_d68c_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1557_c2_d68c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_4406_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1573_c7_4406_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_06ae_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1579_c30_8268_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1577_c7_06ae] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_06ae_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_06ae_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_06ae_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_06ae_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_06ae_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_06ae_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_06ae_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_06ae_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1557_c2_d68c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_d68c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_d68c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_d68c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_d68c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_d68c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_d68c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_d68c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_d68c_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1557_c2_d68c] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_d68c_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_d68c_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_d68c_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_d68c_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_d68c_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_d68c_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_d68c_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_d68c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1584_c7_9c0e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_9c0e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_9c0e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_9c0e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_9c0e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_9c0e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_9c0e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_9c0e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_9c0e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1584_c7_9c0e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_9c0e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_9c0e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_9c0e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_9c0e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_9c0e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_9c0e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_9c0e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_9c0e_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1587_c22_19c2] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1587_c22_19c2_return_output := CAST_TO_uint16_t_uint9_t(
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_afb0_return_output);

     -- result_u8_value_MUX[uxn_opcodes_h_l1584_c7_9c0e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1584_c7_9c0e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1584_c7_9c0e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1584_c7_9c0e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1584_c7_9c0e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1584_c7_9c0e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1584_c7_9c0e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1584_c7_9c0e_return_output := result_u8_value_MUX_uxn_opcodes_h_l1584_c7_9c0e_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1557_c2_d68c] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_d68c_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_d68c_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_d68c_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_d68c_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_d68c_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_d68c_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_d68c_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_d68c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1573_c7_4406] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_4406_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_4406_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_4406_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_4406_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_4406_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_4406_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_4406_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_4406_return_output;

     -- t8_MUX[uxn_opcodes_h_l1573_c7_4406] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1573_c7_4406_cond <= VAR_t8_MUX_uxn_opcodes_h_l1573_c7_4406_cond;
     t8_MUX_uxn_opcodes_h_l1573_c7_4406_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1573_c7_4406_iftrue;
     t8_MUX_uxn_opcodes_h_l1573_c7_4406_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1573_c7_4406_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1573_c7_4406_return_output := t8_MUX_uxn_opcodes_h_l1573_c7_4406_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1584_c7_9c0e] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1584_c7_9c0e_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1584_c7_9c0e_cond;
     n16_low_MUX_uxn_opcodes_h_l1584_c7_9c0e_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1584_c7_9c0e_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1584_c7_9c0e_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1584_c7_9c0e_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1584_c7_9c0e_return_output := n16_low_MUX_uxn_opcodes_h_l1584_c7_9c0e_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1557_c2_d68c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_d68c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_d68c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_d68c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_d68c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_d68c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_d68c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_d68c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_d68c_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l1577_c7_06ae] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1577_c7_06ae_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1577_c7_06ae_cond;
     n16_high_MUX_uxn_opcodes_h_l1577_c7_06ae_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1577_c7_06ae_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1577_c7_06ae_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1577_c7_06ae_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1577_c7_06ae_return_output := n16_high_MUX_uxn_opcodes_h_l1577_c7_06ae_return_output;

     -- Submodule level 2
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1584_c7_9c0e_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1587_c22_19c2_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l1573_c7_4406_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l1577_c7_06ae_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1577_c7_06ae_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1584_c7_9c0e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_06ae_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_9c0e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_4406_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_06ae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_06ae_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_9c0e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_cdf3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_4406_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1577_c7_06ae_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1584_c7_9c0e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1570_c7_cdf3_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1573_c7_4406_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1577_c7_06ae] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1577_c7_06ae_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1577_c7_06ae_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1577_c7_06ae_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1577_c7_06ae_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1577_c7_06ae_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1577_c7_06ae_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1577_c7_06ae_return_output := result_u8_value_MUX_uxn_opcodes_h_l1577_c7_06ae_return_output;

     -- t8_MUX[uxn_opcodes_h_l1570_c7_cdf3] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1570_c7_cdf3_cond <= VAR_t8_MUX_uxn_opcodes_h_l1570_c7_cdf3_cond;
     t8_MUX_uxn_opcodes_h_l1570_c7_cdf3_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1570_c7_cdf3_iftrue;
     t8_MUX_uxn_opcodes_h_l1570_c7_cdf3_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1570_c7_cdf3_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1570_c7_cdf3_return_output := t8_MUX_uxn_opcodes_h_l1570_c7_cdf3_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1577_c7_06ae] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1577_c7_06ae_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1577_c7_06ae_cond;
     n16_low_MUX_uxn_opcodes_h_l1577_c7_06ae_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1577_c7_06ae_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1577_c7_06ae_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1577_c7_06ae_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1577_c7_06ae_return_output := n16_low_MUX_uxn_opcodes_h_l1577_c7_06ae_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1577_c7_06ae] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_06ae_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_06ae_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_06ae_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_06ae_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_06ae_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_06ae_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_06ae_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_06ae_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1570_c7_cdf3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_cdf3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_cdf3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_cdf3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_cdf3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_cdf3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_cdf3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_cdf3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_cdf3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1577_c7_06ae] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_06ae_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_06ae_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_06ae_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_06ae_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_06ae_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_06ae_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_06ae_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_06ae_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1573_c7_4406] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_4406_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_4406_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_4406_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_4406_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_4406_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_4406_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_4406_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_4406_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l1573_c7_4406] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1573_c7_4406_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1573_c7_4406_cond;
     n16_high_MUX_uxn_opcodes_h_l1573_c7_4406_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1573_c7_4406_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1573_c7_4406_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1573_c7_4406_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1573_c7_4406_return_output := n16_high_MUX_uxn_opcodes_h_l1573_c7_4406_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1584_c7_9c0e] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1584_c7_9c0e_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1584_c7_9c0e_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1584_c7_9c0e_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1584_c7_9c0e_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1584_c7_9c0e_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1584_c7_9c0e_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1584_c7_9c0e_return_output := result_u16_value_MUX_uxn_opcodes_h_l1584_c7_9c0e_return_output;

     -- Submodule level 3
     VAR_n16_high_MUX_uxn_opcodes_h_l1570_c7_cdf3_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l1573_c7_4406_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1573_c7_4406_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1577_c7_06ae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_4406_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_06ae_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_cdf3_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_4406_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_4406_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_06ae_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_d68c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_cdf3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1577_c7_06ae_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1584_c7_9c0e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1573_c7_4406_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1577_c7_06ae_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1557_c2_d68c_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1570_c7_cdf3_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1573_c7_4406] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1573_c7_4406_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1573_c7_4406_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1573_c7_4406_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1573_c7_4406_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1573_c7_4406_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1573_c7_4406_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1573_c7_4406_return_output := result_u8_value_MUX_uxn_opcodes_h_l1573_c7_4406_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1573_c7_4406] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_4406_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_4406_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_4406_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_4406_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_4406_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_4406_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_4406_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_4406_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1573_c7_4406] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1573_c7_4406_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1573_c7_4406_cond;
     n16_low_MUX_uxn_opcodes_h_l1573_c7_4406_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1573_c7_4406_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1573_c7_4406_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1573_c7_4406_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1573_c7_4406_return_output := n16_low_MUX_uxn_opcodes_h_l1573_c7_4406_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l1570_c7_cdf3] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1570_c7_cdf3_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1570_c7_cdf3_cond;
     n16_high_MUX_uxn_opcodes_h_l1570_c7_cdf3_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1570_c7_cdf3_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1570_c7_cdf3_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1570_c7_cdf3_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1570_c7_cdf3_return_output := n16_high_MUX_uxn_opcodes_h_l1570_c7_cdf3_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1577_c7_06ae] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1577_c7_06ae_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1577_c7_06ae_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1577_c7_06ae_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1577_c7_06ae_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1577_c7_06ae_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1577_c7_06ae_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1577_c7_06ae_return_output := result_u16_value_MUX_uxn_opcodes_h_l1577_c7_06ae_return_output;

     -- t8_MUX[uxn_opcodes_h_l1557_c2_d68c] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1557_c2_d68c_cond <= VAR_t8_MUX_uxn_opcodes_h_l1557_c2_d68c_cond;
     t8_MUX_uxn_opcodes_h_l1557_c2_d68c_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1557_c2_d68c_iftrue;
     t8_MUX_uxn_opcodes_h_l1557_c2_d68c_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1557_c2_d68c_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1557_c2_d68c_return_output := t8_MUX_uxn_opcodes_h_l1557_c2_d68c_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1570_c7_cdf3] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_cdf3_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_cdf3_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_cdf3_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_cdf3_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_cdf3_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_cdf3_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_cdf3_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_cdf3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1557_c2_d68c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_d68c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_d68c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_d68c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_d68c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_d68c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_d68c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_d68c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_d68c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1573_c7_4406] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_4406_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_4406_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_4406_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_4406_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_4406_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_4406_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_4406_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_4406_return_output;

     -- Submodule level 4
     VAR_n16_high_MUX_uxn_opcodes_h_l1557_c2_d68c_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l1570_c7_cdf3_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1570_c7_cdf3_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1573_c7_4406_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_cdf3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_4406_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_d68c_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_cdf3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_cdf3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_4406_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1573_c7_4406_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1577_c7_06ae_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1570_c7_cdf3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1573_c7_4406_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1557_c2_d68c_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1570_c7_cdf3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1570_c7_cdf3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1570_c7_cdf3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1570_c7_cdf3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1570_c7_cdf3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1570_c7_cdf3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1570_c7_cdf3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1570_c7_cdf3_return_output := result_u8_value_MUX_uxn_opcodes_h_l1570_c7_cdf3_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l1557_c2_d68c] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1557_c2_d68c_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1557_c2_d68c_cond;
     n16_high_MUX_uxn_opcodes_h_l1557_c2_d68c_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1557_c2_d68c_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1557_c2_d68c_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1557_c2_d68c_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1557_c2_d68c_return_output := n16_high_MUX_uxn_opcodes_h_l1557_c2_d68c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1570_c7_cdf3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_cdf3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_cdf3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_cdf3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_cdf3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_cdf3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_cdf3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_cdf3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_cdf3_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1557_c2_d68c] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_d68c_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_d68c_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_d68c_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_d68c_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_d68c_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_d68c_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_d68c_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_d68c_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1573_c7_4406] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1573_c7_4406_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1573_c7_4406_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1573_c7_4406_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1573_c7_4406_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1573_c7_4406_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1573_c7_4406_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1573_c7_4406_return_output := result_u16_value_MUX_uxn_opcodes_h_l1573_c7_4406_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1570_c7_cdf3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_cdf3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_cdf3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_cdf3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_cdf3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_cdf3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_cdf3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_cdf3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_cdf3_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1570_c7_cdf3] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1570_c7_cdf3_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1570_c7_cdf3_cond;
     n16_low_MUX_uxn_opcodes_h_l1570_c7_cdf3_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1570_c7_cdf3_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1570_c7_cdf3_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1570_c7_cdf3_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1570_c7_cdf3_return_output := n16_low_MUX_uxn_opcodes_h_l1570_c7_cdf3_return_output;

     -- Submodule level 5
     REG_VAR_n16_high := VAR_n16_high_MUX_uxn_opcodes_h_l1557_c2_d68c_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1557_c2_d68c_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1570_c7_cdf3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_d68c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_cdf3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_d68c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_cdf3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1570_c7_cdf3_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1573_c7_4406_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1557_c2_d68c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1570_c7_cdf3_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1557_c2_d68c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_d68c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_d68c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_d68c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_d68c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_d68c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_d68c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_d68c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_d68c_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1557_c2_d68c] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1557_c2_d68c_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1557_c2_d68c_cond;
     n16_low_MUX_uxn_opcodes_h_l1557_c2_d68c_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1557_c2_d68c_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1557_c2_d68c_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1557_c2_d68c_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1557_c2_d68c_return_output := n16_low_MUX_uxn_opcodes_h_l1557_c2_d68c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1557_c2_d68c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1557_c2_d68c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1557_c2_d68c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1557_c2_d68c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1557_c2_d68c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1557_c2_d68c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1557_c2_d68c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1557_c2_d68c_return_output := result_u8_value_MUX_uxn_opcodes_h_l1557_c2_d68c_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1570_c7_cdf3] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1570_c7_cdf3_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1570_c7_cdf3_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1570_c7_cdf3_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1570_c7_cdf3_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1570_c7_cdf3_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1570_c7_cdf3_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1570_c7_cdf3_return_output := result_u16_value_MUX_uxn_opcodes_h_l1570_c7_cdf3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1557_c2_d68c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_d68c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_d68c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_d68c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_d68c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_d68c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_d68c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_d68c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_d68c_return_output;

     -- Submodule level 6
     REG_VAR_n16_low := VAR_n16_low_MUX_uxn_opcodes_h_l1557_c2_d68c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1557_c2_d68c_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1570_c7_cdf3_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1557_c2_d68c] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1557_c2_d68c_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1557_c2_d68c_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1557_c2_d68c_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1557_c2_d68c_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1557_c2_d68c_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1557_c2_d68c_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1557_c2_d68c_return_output := result_u16_value_MUX_uxn_opcodes_h_l1557_c2_d68c_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_500b_uxn_opcodes_h_l1592_l1552_DUPLICATE_fcb0 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_500b_uxn_opcodes_h_l1592_l1552_DUPLICATE_fcb0_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_500b(
     result,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_d68c_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_d68c_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1557_c2_d68c_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1557_c2_d68c_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_d68c_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_d68c_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_d68c_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_d68c_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_d68c_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_d68c_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_500b_uxn_opcodes_h_l1592_l1552_DUPLICATE_fcb0_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_500b_uxn_opcodes_h_l1592_l1552_DUPLICATE_fcb0_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n16_low <= REG_VAR_n16_low;
REG_COMB_n16_high <= REG_VAR_n16_high;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n16_low <= REG_COMB_n16_low;
     n16_high <= REG_COMB_n16_high;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
