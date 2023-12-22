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
-- Submodules: 60
entity ldz2_0CLK_2ab048cc is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ldz2_0CLK_2ab048cc;
architecture arch of ldz2_0CLK_2ab048cc is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal tmp8_high : unsigned(7 downto 0) := to_unsigned(0, 8);
signal tmp8_low : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_tmp8_high : unsigned(7 downto 0);
signal REG_COMB_tmp8_low : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1494_c6_0163]
signal BIN_OP_EQ_uxn_opcodes_h_l1494_c6_0163_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1494_c6_0163_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1494_c6_0163_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1494_c2_9779]
signal t8_MUX_uxn_opcodes_h_l1494_c2_9779_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1494_c2_9779_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1494_c2_9779_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1494_c2_9779_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1494_c2_9779]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1494_c2_9779_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1494_c2_9779_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1494_c2_9779_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1494_c2_9779_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1494_c2_9779]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1494_c2_9779_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1494_c2_9779_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1494_c2_9779_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1494_c2_9779_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1494_c2_9779]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1494_c2_9779_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1494_c2_9779_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1494_c2_9779_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1494_c2_9779_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1494_c2_9779]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1494_c2_9779_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1494_c2_9779_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1494_c2_9779_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1494_c2_9779_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1494_c2_9779]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1494_c2_9779_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1494_c2_9779_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1494_c2_9779_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1494_c2_9779_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1494_c2_9779]
signal result_u8_value_MUX_uxn_opcodes_h_l1494_c2_9779_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1494_c2_9779_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1494_c2_9779_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1494_c2_9779_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1494_c2_9779]
signal result_u16_value_MUX_uxn_opcodes_h_l1494_c2_9779_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1494_c2_9779_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1494_c2_9779_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1494_c2_9779_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1494_c2_9779]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1494_c2_9779_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1494_c2_9779_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1494_c2_9779_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1494_c2_9779_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1494_c2_9779]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1494_c2_9779_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1494_c2_9779_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1494_c2_9779_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1494_c2_9779_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1494_c2_9779]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1494_c2_9779_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1494_c2_9779_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1494_c2_9779_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1494_c2_9779_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1494_c2_9779]
signal tmp8_low_MUX_uxn_opcodes_h_l1494_c2_9779_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1494_c2_9779_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1494_c2_9779_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1494_c2_9779_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1494_c2_9779]
signal tmp8_high_MUX_uxn_opcodes_h_l1494_c2_9779_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1494_c2_9779_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1494_c2_9779_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1494_c2_9779_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1507_c11_9e92]
signal BIN_OP_EQ_uxn_opcodes_h_l1507_c11_9e92_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1507_c11_9e92_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1507_c11_9e92_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1507_c7_7352]
signal t8_MUX_uxn_opcodes_h_l1507_c7_7352_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1507_c7_7352_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1507_c7_7352_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1507_c7_7352_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1507_c7_7352]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_7352_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_7352_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_7352_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_7352_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1507_c7_7352]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_7352_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_7352_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_7352_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_7352_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1507_c7_7352]
signal result_u8_value_MUX_uxn_opcodes_h_l1507_c7_7352_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1507_c7_7352_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1507_c7_7352_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1507_c7_7352_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1507_c7_7352]
signal result_u16_value_MUX_uxn_opcodes_h_l1507_c7_7352_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1507_c7_7352_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1507_c7_7352_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1507_c7_7352_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1507_c7_7352]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1507_c7_7352_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1507_c7_7352_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1507_c7_7352_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1507_c7_7352_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1507_c7_7352]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_7352_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_7352_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_7352_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_7352_return_output : signed(3 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1507_c7_7352]
signal tmp8_low_MUX_uxn_opcodes_h_l1507_c7_7352_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1507_c7_7352_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1507_c7_7352_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1507_c7_7352_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1507_c7_7352]
signal tmp8_high_MUX_uxn_opcodes_h_l1507_c7_7352_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1507_c7_7352_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1507_c7_7352_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1507_c7_7352_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1510_c11_b9c4]
signal BIN_OP_EQ_uxn_opcodes_h_l1510_c11_b9c4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1510_c11_b9c4_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1510_c11_b9c4_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1510_c7_9f11]
signal t8_MUX_uxn_opcodes_h_l1510_c7_9f11_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1510_c7_9f11_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1510_c7_9f11_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1510_c7_9f11_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1510_c7_9f11]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1510_c7_9f11_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1510_c7_9f11_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1510_c7_9f11_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1510_c7_9f11_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1510_c7_9f11]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1510_c7_9f11_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1510_c7_9f11_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1510_c7_9f11_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1510_c7_9f11_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1510_c7_9f11]
signal result_u8_value_MUX_uxn_opcodes_h_l1510_c7_9f11_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1510_c7_9f11_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1510_c7_9f11_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1510_c7_9f11_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1510_c7_9f11]
signal result_u16_value_MUX_uxn_opcodes_h_l1510_c7_9f11_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1510_c7_9f11_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1510_c7_9f11_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1510_c7_9f11_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1510_c7_9f11]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1510_c7_9f11_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1510_c7_9f11_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1510_c7_9f11_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1510_c7_9f11_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1510_c7_9f11]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1510_c7_9f11_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1510_c7_9f11_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1510_c7_9f11_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1510_c7_9f11_return_output : signed(3 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1510_c7_9f11]
signal tmp8_low_MUX_uxn_opcodes_h_l1510_c7_9f11_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1510_c7_9f11_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1510_c7_9f11_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1510_c7_9f11_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1510_c7_9f11]
signal tmp8_high_MUX_uxn_opcodes_h_l1510_c7_9f11_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1510_c7_9f11_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1510_c7_9f11_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1510_c7_9f11_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1512_c30_9585]
signal sp_relative_shift_uxn_opcodes_h_l1512_c30_9585_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1512_c30_9585_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1512_c30_9585_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1512_c30_9585_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1515_c11_2b60]
signal BIN_OP_EQ_uxn_opcodes_h_l1515_c11_2b60_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1515_c11_2b60_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1515_c11_2b60_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1515_c7_b551]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_b551_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_b551_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_b551_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_b551_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1515_c7_b551]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1515_c7_b551_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1515_c7_b551_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1515_c7_b551_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1515_c7_b551_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1515_c7_b551]
signal result_u8_value_MUX_uxn_opcodes_h_l1515_c7_b551_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1515_c7_b551_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1515_c7_b551_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1515_c7_b551_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1515_c7_b551]
signal result_u16_value_MUX_uxn_opcodes_h_l1515_c7_b551_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1515_c7_b551_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1515_c7_b551_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1515_c7_b551_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1515_c7_b551]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_b551_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_b551_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_b551_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_b551_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1515_c7_b551]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1515_c7_b551_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1515_c7_b551_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1515_c7_b551_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1515_c7_b551_return_output : signed(3 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1515_c7_b551]
signal tmp8_low_MUX_uxn_opcodes_h_l1515_c7_b551_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1515_c7_b551_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1515_c7_b551_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1515_c7_b551_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1515_c7_b551]
signal tmp8_high_MUX_uxn_opcodes_h_l1515_c7_b551_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1515_c7_b551_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1515_c7_b551_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1515_c7_b551_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1517_c33_dd8b]
signal BIN_OP_PLUS_uxn_opcodes_h_l1517_c33_dd8b_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1517_c33_dd8b_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1517_c33_dd8b_return_output : unsigned(8 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1519_c11_433a]
signal BIN_OP_EQ_uxn_opcodes_h_l1519_c11_433a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1519_c11_433a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1519_c11_433a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1519_c7_4893]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1519_c7_4893_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1519_c7_4893_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1519_c7_4893_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1519_c7_4893_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1519_c7_4893]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1519_c7_4893_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1519_c7_4893_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1519_c7_4893_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1519_c7_4893_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1519_c7_4893]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1519_c7_4893_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1519_c7_4893_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1519_c7_4893_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1519_c7_4893_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1519_c7_4893]
signal result_u8_value_MUX_uxn_opcodes_h_l1519_c7_4893_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1519_c7_4893_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1519_c7_4893_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1519_c7_4893_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1519_c7_4893]
signal tmp8_low_MUX_uxn_opcodes_h_l1519_c7_4893_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1519_c7_4893_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1519_c7_4893_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1519_c7_4893_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1519_c7_4893]
signal tmp8_high_MUX_uxn_opcodes_h_l1519_c7_4893_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1519_c7_4893_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1519_c7_4893_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1519_c7_4893_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1525_c11_b067]
signal BIN_OP_EQ_uxn_opcodes_h_l1525_c11_b067_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1525_c11_b067_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1525_c11_b067_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1525_c7_95b6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_95b6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_95b6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_95b6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_95b6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1525_c7_95b6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_95b6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_95b6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_95b6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_95b6_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1525_c7_95b6]
signal result_u8_value_MUX_uxn_opcodes_h_l1525_c7_95b6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1525_c7_95b6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1525_c7_95b6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1525_c7_95b6_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1525_c7_95b6]
signal tmp8_low_MUX_uxn_opcodes_h_l1525_c7_95b6_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1525_c7_95b6_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1525_c7_95b6_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1525_c7_95b6_return_output : unsigned(7 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_9f32( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : signed;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_opc_done := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.is_ram_write := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.u8_value := ref_toks_6;
      base.u16_value := ref_toks_7;
      base.sp_relative_shift := ref_toks_8;
      base.is_stack_index_flipped := ref_toks_9;
      base.is_pc_updated := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1494_c6_0163
BIN_OP_EQ_uxn_opcodes_h_l1494_c6_0163 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1494_c6_0163_left,
BIN_OP_EQ_uxn_opcodes_h_l1494_c6_0163_right,
BIN_OP_EQ_uxn_opcodes_h_l1494_c6_0163_return_output);

-- t8_MUX_uxn_opcodes_h_l1494_c2_9779
t8_MUX_uxn_opcodes_h_l1494_c2_9779 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1494_c2_9779_cond,
t8_MUX_uxn_opcodes_h_l1494_c2_9779_iftrue,
t8_MUX_uxn_opcodes_h_l1494_c2_9779_iffalse,
t8_MUX_uxn_opcodes_h_l1494_c2_9779_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1494_c2_9779
result_is_opc_done_MUX_uxn_opcodes_h_l1494_c2_9779 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1494_c2_9779_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1494_c2_9779_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1494_c2_9779_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1494_c2_9779_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1494_c2_9779
result_is_vram_write_MUX_uxn_opcodes_h_l1494_c2_9779 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1494_c2_9779_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1494_c2_9779_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1494_c2_9779_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1494_c2_9779_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1494_c2_9779
result_is_ram_write_MUX_uxn_opcodes_h_l1494_c2_9779 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1494_c2_9779_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1494_c2_9779_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1494_c2_9779_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1494_c2_9779_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1494_c2_9779
result_is_stack_write_MUX_uxn_opcodes_h_l1494_c2_9779 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1494_c2_9779_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1494_c2_9779_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1494_c2_9779_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1494_c2_9779_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1494_c2_9779
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1494_c2_9779 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1494_c2_9779_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1494_c2_9779_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1494_c2_9779_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1494_c2_9779_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1494_c2_9779
result_u8_value_MUX_uxn_opcodes_h_l1494_c2_9779 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1494_c2_9779_cond,
result_u8_value_MUX_uxn_opcodes_h_l1494_c2_9779_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1494_c2_9779_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1494_c2_9779_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1494_c2_9779
result_u16_value_MUX_uxn_opcodes_h_l1494_c2_9779 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1494_c2_9779_cond,
result_u16_value_MUX_uxn_opcodes_h_l1494_c2_9779_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1494_c2_9779_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1494_c2_9779_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1494_c2_9779
result_sp_relative_shift_MUX_uxn_opcodes_h_l1494_c2_9779 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1494_c2_9779_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1494_c2_9779_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1494_c2_9779_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1494_c2_9779_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1494_c2_9779
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1494_c2_9779 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1494_c2_9779_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1494_c2_9779_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1494_c2_9779_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1494_c2_9779_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1494_c2_9779
result_is_pc_updated_MUX_uxn_opcodes_h_l1494_c2_9779 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1494_c2_9779_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1494_c2_9779_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1494_c2_9779_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1494_c2_9779_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1494_c2_9779
tmp8_low_MUX_uxn_opcodes_h_l1494_c2_9779 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1494_c2_9779_cond,
tmp8_low_MUX_uxn_opcodes_h_l1494_c2_9779_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1494_c2_9779_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1494_c2_9779_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1494_c2_9779
tmp8_high_MUX_uxn_opcodes_h_l1494_c2_9779 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1494_c2_9779_cond,
tmp8_high_MUX_uxn_opcodes_h_l1494_c2_9779_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1494_c2_9779_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1494_c2_9779_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1507_c11_9e92
BIN_OP_EQ_uxn_opcodes_h_l1507_c11_9e92 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1507_c11_9e92_left,
BIN_OP_EQ_uxn_opcodes_h_l1507_c11_9e92_right,
BIN_OP_EQ_uxn_opcodes_h_l1507_c11_9e92_return_output);

-- t8_MUX_uxn_opcodes_h_l1507_c7_7352
t8_MUX_uxn_opcodes_h_l1507_c7_7352 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1507_c7_7352_cond,
t8_MUX_uxn_opcodes_h_l1507_c7_7352_iftrue,
t8_MUX_uxn_opcodes_h_l1507_c7_7352_iffalse,
t8_MUX_uxn_opcodes_h_l1507_c7_7352_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_7352
result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_7352 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_7352_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_7352_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_7352_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_7352_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_7352
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_7352 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_7352_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_7352_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_7352_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_7352_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1507_c7_7352
result_u8_value_MUX_uxn_opcodes_h_l1507_c7_7352 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1507_c7_7352_cond,
result_u8_value_MUX_uxn_opcodes_h_l1507_c7_7352_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1507_c7_7352_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1507_c7_7352_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1507_c7_7352
result_u16_value_MUX_uxn_opcodes_h_l1507_c7_7352 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1507_c7_7352_cond,
result_u16_value_MUX_uxn_opcodes_h_l1507_c7_7352_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1507_c7_7352_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1507_c7_7352_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1507_c7_7352
result_is_stack_write_MUX_uxn_opcodes_h_l1507_c7_7352 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1507_c7_7352_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1507_c7_7352_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1507_c7_7352_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1507_c7_7352_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_7352
result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_7352 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_7352_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_7352_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_7352_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_7352_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1507_c7_7352
tmp8_low_MUX_uxn_opcodes_h_l1507_c7_7352 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1507_c7_7352_cond,
tmp8_low_MUX_uxn_opcodes_h_l1507_c7_7352_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1507_c7_7352_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1507_c7_7352_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1507_c7_7352
tmp8_high_MUX_uxn_opcodes_h_l1507_c7_7352 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1507_c7_7352_cond,
tmp8_high_MUX_uxn_opcodes_h_l1507_c7_7352_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1507_c7_7352_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1507_c7_7352_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1510_c11_b9c4
BIN_OP_EQ_uxn_opcodes_h_l1510_c11_b9c4 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1510_c11_b9c4_left,
BIN_OP_EQ_uxn_opcodes_h_l1510_c11_b9c4_right,
BIN_OP_EQ_uxn_opcodes_h_l1510_c11_b9c4_return_output);

-- t8_MUX_uxn_opcodes_h_l1510_c7_9f11
t8_MUX_uxn_opcodes_h_l1510_c7_9f11 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1510_c7_9f11_cond,
t8_MUX_uxn_opcodes_h_l1510_c7_9f11_iftrue,
t8_MUX_uxn_opcodes_h_l1510_c7_9f11_iffalse,
t8_MUX_uxn_opcodes_h_l1510_c7_9f11_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1510_c7_9f11
result_is_opc_done_MUX_uxn_opcodes_h_l1510_c7_9f11 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1510_c7_9f11_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1510_c7_9f11_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1510_c7_9f11_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1510_c7_9f11_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1510_c7_9f11
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1510_c7_9f11 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1510_c7_9f11_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1510_c7_9f11_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1510_c7_9f11_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1510_c7_9f11_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1510_c7_9f11
result_u8_value_MUX_uxn_opcodes_h_l1510_c7_9f11 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1510_c7_9f11_cond,
result_u8_value_MUX_uxn_opcodes_h_l1510_c7_9f11_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1510_c7_9f11_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1510_c7_9f11_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1510_c7_9f11
result_u16_value_MUX_uxn_opcodes_h_l1510_c7_9f11 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1510_c7_9f11_cond,
result_u16_value_MUX_uxn_opcodes_h_l1510_c7_9f11_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1510_c7_9f11_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1510_c7_9f11_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1510_c7_9f11
result_is_stack_write_MUX_uxn_opcodes_h_l1510_c7_9f11 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1510_c7_9f11_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1510_c7_9f11_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1510_c7_9f11_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1510_c7_9f11_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1510_c7_9f11
result_sp_relative_shift_MUX_uxn_opcodes_h_l1510_c7_9f11 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1510_c7_9f11_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1510_c7_9f11_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1510_c7_9f11_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1510_c7_9f11_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1510_c7_9f11
tmp8_low_MUX_uxn_opcodes_h_l1510_c7_9f11 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1510_c7_9f11_cond,
tmp8_low_MUX_uxn_opcodes_h_l1510_c7_9f11_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1510_c7_9f11_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1510_c7_9f11_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1510_c7_9f11
tmp8_high_MUX_uxn_opcodes_h_l1510_c7_9f11 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1510_c7_9f11_cond,
tmp8_high_MUX_uxn_opcodes_h_l1510_c7_9f11_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1510_c7_9f11_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1510_c7_9f11_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1512_c30_9585
sp_relative_shift_uxn_opcodes_h_l1512_c30_9585 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1512_c30_9585_ins,
sp_relative_shift_uxn_opcodes_h_l1512_c30_9585_x,
sp_relative_shift_uxn_opcodes_h_l1512_c30_9585_y,
sp_relative_shift_uxn_opcodes_h_l1512_c30_9585_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1515_c11_2b60
BIN_OP_EQ_uxn_opcodes_h_l1515_c11_2b60 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1515_c11_2b60_left,
BIN_OP_EQ_uxn_opcodes_h_l1515_c11_2b60_right,
BIN_OP_EQ_uxn_opcodes_h_l1515_c11_2b60_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_b551
result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_b551 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_b551_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_b551_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_b551_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_b551_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1515_c7_b551
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1515_c7_b551 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1515_c7_b551_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1515_c7_b551_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1515_c7_b551_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1515_c7_b551_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1515_c7_b551
result_u8_value_MUX_uxn_opcodes_h_l1515_c7_b551 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1515_c7_b551_cond,
result_u8_value_MUX_uxn_opcodes_h_l1515_c7_b551_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1515_c7_b551_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1515_c7_b551_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1515_c7_b551
result_u16_value_MUX_uxn_opcodes_h_l1515_c7_b551 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1515_c7_b551_cond,
result_u16_value_MUX_uxn_opcodes_h_l1515_c7_b551_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1515_c7_b551_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1515_c7_b551_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_b551
result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_b551 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_b551_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_b551_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_b551_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_b551_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1515_c7_b551
result_sp_relative_shift_MUX_uxn_opcodes_h_l1515_c7_b551 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1515_c7_b551_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1515_c7_b551_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1515_c7_b551_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1515_c7_b551_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1515_c7_b551
tmp8_low_MUX_uxn_opcodes_h_l1515_c7_b551 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1515_c7_b551_cond,
tmp8_low_MUX_uxn_opcodes_h_l1515_c7_b551_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1515_c7_b551_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1515_c7_b551_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1515_c7_b551
tmp8_high_MUX_uxn_opcodes_h_l1515_c7_b551 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1515_c7_b551_cond,
tmp8_high_MUX_uxn_opcodes_h_l1515_c7_b551_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1515_c7_b551_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1515_c7_b551_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1517_c33_dd8b
BIN_OP_PLUS_uxn_opcodes_h_l1517_c33_dd8b : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1517_c33_dd8b_left,
BIN_OP_PLUS_uxn_opcodes_h_l1517_c33_dd8b_right,
BIN_OP_PLUS_uxn_opcodes_h_l1517_c33_dd8b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1519_c11_433a
BIN_OP_EQ_uxn_opcodes_h_l1519_c11_433a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1519_c11_433a_left,
BIN_OP_EQ_uxn_opcodes_h_l1519_c11_433a_right,
BIN_OP_EQ_uxn_opcodes_h_l1519_c11_433a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1519_c7_4893
result_is_opc_done_MUX_uxn_opcodes_h_l1519_c7_4893 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1519_c7_4893_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1519_c7_4893_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1519_c7_4893_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1519_c7_4893_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1519_c7_4893
result_is_stack_write_MUX_uxn_opcodes_h_l1519_c7_4893 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1519_c7_4893_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1519_c7_4893_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1519_c7_4893_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1519_c7_4893_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1519_c7_4893
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1519_c7_4893 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1519_c7_4893_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1519_c7_4893_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1519_c7_4893_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1519_c7_4893_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1519_c7_4893
result_u8_value_MUX_uxn_opcodes_h_l1519_c7_4893 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1519_c7_4893_cond,
result_u8_value_MUX_uxn_opcodes_h_l1519_c7_4893_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1519_c7_4893_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1519_c7_4893_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1519_c7_4893
tmp8_low_MUX_uxn_opcodes_h_l1519_c7_4893 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1519_c7_4893_cond,
tmp8_low_MUX_uxn_opcodes_h_l1519_c7_4893_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1519_c7_4893_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1519_c7_4893_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1519_c7_4893
tmp8_high_MUX_uxn_opcodes_h_l1519_c7_4893 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1519_c7_4893_cond,
tmp8_high_MUX_uxn_opcodes_h_l1519_c7_4893_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1519_c7_4893_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1519_c7_4893_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1525_c11_b067
BIN_OP_EQ_uxn_opcodes_h_l1525_c11_b067 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1525_c11_b067_left,
BIN_OP_EQ_uxn_opcodes_h_l1525_c11_b067_right,
BIN_OP_EQ_uxn_opcodes_h_l1525_c11_b067_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_95b6
result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_95b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_95b6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_95b6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_95b6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_95b6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_95b6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_95b6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_95b6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_95b6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_95b6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_95b6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1525_c7_95b6
result_u8_value_MUX_uxn_opcodes_h_l1525_c7_95b6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1525_c7_95b6_cond,
result_u8_value_MUX_uxn_opcodes_h_l1525_c7_95b6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1525_c7_95b6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1525_c7_95b6_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1525_c7_95b6
tmp8_low_MUX_uxn_opcodes_h_l1525_c7_95b6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1525_c7_95b6_cond,
tmp8_low_MUX_uxn_opcodes_h_l1525_c7_95b6_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1525_c7_95b6_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1525_c7_95b6_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 t8,
 tmp8_high,
 tmp8_low,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1494_c6_0163_return_output,
 t8_MUX_uxn_opcodes_h_l1494_c2_9779_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1494_c2_9779_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1494_c2_9779_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1494_c2_9779_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1494_c2_9779_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1494_c2_9779_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1494_c2_9779_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1494_c2_9779_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1494_c2_9779_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1494_c2_9779_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1494_c2_9779_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1494_c2_9779_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1494_c2_9779_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1507_c11_9e92_return_output,
 t8_MUX_uxn_opcodes_h_l1507_c7_7352_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_7352_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_7352_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1507_c7_7352_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1507_c7_7352_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1507_c7_7352_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_7352_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1507_c7_7352_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1507_c7_7352_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1510_c11_b9c4_return_output,
 t8_MUX_uxn_opcodes_h_l1510_c7_9f11_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1510_c7_9f11_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1510_c7_9f11_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1510_c7_9f11_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1510_c7_9f11_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1510_c7_9f11_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1510_c7_9f11_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1510_c7_9f11_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1510_c7_9f11_return_output,
 sp_relative_shift_uxn_opcodes_h_l1512_c30_9585_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1515_c11_2b60_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_b551_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1515_c7_b551_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1515_c7_b551_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1515_c7_b551_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_b551_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1515_c7_b551_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1515_c7_b551_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1515_c7_b551_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1517_c33_dd8b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1519_c11_433a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1519_c7_4893_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1519_c7_4893_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1519_c7_4893_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1519_c7_4893_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1519_c7_4893_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1519_c7_4893_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1525_c11_b067_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_95b6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_95b6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1525_c7_95b6_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1525_c7_95b6_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1494_c6_0163_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1494_c6_0163_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1494_c6_0163_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1494_c2_9779_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1494_c2_9779_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1507_c7_7352_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1494_c2_9779_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1494_c2_9779_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1494_c2_9779_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1494_c2_9779_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_7352_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1494_c2_9779_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1494_c2_9779_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1494_c2_9779_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1494_c2_9779_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1494_c2_9779_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1494_c2_9779_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1494_c2_9779_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1494_c2_9779_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1494_c2_9779_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1494_c2_9779_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1494_c2_9779_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1494_c2_9779_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1494_c2_9779_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1494_c2_9779_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1507_c7_7352_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1494_c2_9779_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1494_c2_9779_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1494_c2_9779_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1504_c3_1039 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1494_c2_9779_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_7352_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1494_c2_9779_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1494_c2_9779_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1494_c2_9779_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1494_c2_9779_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_7352_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1494_c2_9779_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1494_c2_9779_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1494_c2_9779_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1494_c2_9779_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1507_c7_7352_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1494_c2_9779_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1494_c2_9779_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1494_c2_9779_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1499_c3_fc3e : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1494_c2_9779_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_7352_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1494_c2_9779_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1494_c2_9779_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1494_c2_9779_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1494_c2_9779_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1494_c2_9779_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1494_c2_9779_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1494_c2_9779_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1494_c2_9779_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1494_c2_9779_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1494_c2_9779_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1494_c2_9779_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1494_c2_9779_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1494_c2_9779_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1494_c2_9779_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1507_c7_7352_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1494_c2_9779_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1494_c2_9779_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1494_c2_9779_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1494_c2_9779_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1507_c7_7352_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1494_c2_9779_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1494_c2_9779_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_9e92_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_9e92_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_9e92_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1507_c7_7352_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1507_c7_7352_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1510_c7_9f11_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1507_c7_7352_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_7352_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_7352_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1510_c7_9f11_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_7352_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_7352_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1508_c3_424a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_7352_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1510_c7_9f11_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_7352_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_7352_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_7352_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1510_c7_9f11_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_7352_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1507_c7_7352_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1507_c7_7352_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1510_c7_9f11_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1507_c7_7352_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1507_c7_7352_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1507_c7_7352_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1510_c7_9f11_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1507_c7_7352_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_7352_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_7352_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1510_c7_9f11_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_7352_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1507_c7_7352_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1507_c7_7352_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1510_c7_9f11_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1507_c7_7352_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1507_c7_7352_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1507_c7_7352_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1510_c7_9f11_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1507_c7_7352_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1510_c11_b9c4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1510_c11_b9c4_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1510_c11_b9c4_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1510_c7_9f11_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1510_c7_9f11_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1510_c7_9f11_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1510_c7_9f11_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1510_c7_9f11_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_b551_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1510_c7_9f11_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1510_c7_9f11_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1510_c7_9f11_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1515_c7_b551_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1510_c7_9f11_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1510_c7_9f11_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1510_c7_9f11_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1515_c7_b551_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1510_c7_9f11_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1510_c7_9f11_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1510_c7_9f11_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1515_c7_b551_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1510_c7_9f11_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1510_c7_9f11_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1510_c7_9f11_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_b551_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1510_c7_9f11_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1510_c7_9f11_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1510_c7_9f11_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1515_c7_b551_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1510_c7_9f11_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1510_c7_9f11_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1510_c7_9f11_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1515_c7_b551_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1510_c7_9f11_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1510_c7_9f11_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1510_c7_9f11_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1515_c7_b551_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1510_c7_9f11_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1512_c30_9585_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1512_c30_9585_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1512_c30_9585_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1512_c30_9585_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1513_c22_907f_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1515_c11_2b60_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1515_c11_2b60_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1515_c11_2b60_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_b551_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_b551_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1519_c7_4893_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_b551_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1515_c7_b551_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1515_c7_b551_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1519_c7_4893_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1515_c7_b551_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1515_c7_b551_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1515_c7_b551_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1519_c7_4893_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1515_c7_b551_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1515_c7_b551_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1515_c7_b551_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1515_c7_b551_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_b551_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_b551_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1519_c7_4893_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_b551_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1515_c7_b551_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1516_c3_63d7 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1515_c7_b551_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1515_c7_b551_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1515_c7_b551_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1515_c7_b551_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1519_c7_4893_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1515_c7_b551_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1515_c7_b551_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1515_c7_b551_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1519_c7_4893_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1515_c7_b551_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1517_c33_dd8b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1517_c33_dd8b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1517_c33_dd8b_return_output : unsigned(8 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1517_c22_5abc_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1519_c11_433a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1519_c11_433a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1519_c11_433a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1519_c7_4893_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1519_c7_4893_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_95b6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1519_c7_4893_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1519_c7_4893_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1519_c7_4893_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1519_c7_4893_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1519_c7_4893_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1522_c3_98ce : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1519_c7_4893_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_95b6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1519_c7_4893_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1519_c7_4893_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1519_c7_4893_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1525_c7_95b6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1519_c7_4893_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1519_c7_4893_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1519_c7_4893_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1525_c7_95b6_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1519_c7_4893_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1519_c7_4893_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1519_c7_4893_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1519_c7_4893_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1525_c11_b067_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1525_c11_b067_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1525_c11_b067_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_95b6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_95b6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_95b6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_95b6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1527_c3_4572 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_95b6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_95b6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1525_c7_95b6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1525_c7_95b6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1525_c7_95b6_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1525_c7_95b6_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1525_c7_95b6_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1525_c7_95b6_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1507_l1494_l1525_l1515_l1510_DUPLICATE_dc10_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1507_l1494_l1515_DUPLICATE_b2f0_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1507_l1525_l1519_l1515_l1510_DUPLICATE_778f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1507_l1519_l1510_l1515_DUPLICATE_6235_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1507_l1515_DUPLICATE_7024_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1510_l1525_l1515_DUPLICATE_bd3e_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9f32_uxn_opcodes_h_l1490_l1532_DUPLICATE_377e_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_tmp8_high : unsigned(7 downto 0);
variable REG_VAR_tmp8_low : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_tmp8_high := tmp8_high;
  REG_VAR_tmp8_low := tmp8_low;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1516_c3_63d7 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1515_c7_b551_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1516_c3_63d7;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1504_c3_1039 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1494_c2_9779_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1504_c3_1039;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1522_c3_98ce := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1519_c7_4893_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1522_c3_98ce;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1494_c2_9779_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1494_c2_9779_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1512_c30_9585_y := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1517_c33_dd8b_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1527_c3_4572 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_95b6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1527_c3_4572;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_95b6_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1515_c11_2b60_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1494_c2_9779_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1494_c2_9779_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1525_c11_b067_right := to_unsigned(5, 3);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1494_c2_9779_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1512_c30_9585_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1519_c7_4893_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1510_c11_b9c4_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1519_c11_433a_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1508_c3_424a := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_7352_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1508_c3_424a;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1494_c2_9779_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1494_c6_0163_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_9e92_right := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1499_c3_fc3e := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1494_c2_9779_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1499_c3_fc3e;

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
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_sp_relative_shift_uxn_opcodes_h_l1512_c30_9585_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1494_c6_0163_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_9e92_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1510_c11_b9c4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1515_c11_2b60_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1519_c11_433a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1525_c11_b067_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1519_c7_4893_iftrue := VAR_previous_ram_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1525_c7_95b6_iftrue := VAR_previous_ram_read;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1519_c7_4893_iftrue := VAR_previous_ram_read;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1525_c7_95b6_iftrue := VAR_previous_ram_read;
     VAR_t8_MUX_uxn_opcodes_h_l1510_c7_9f11_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1517_c33_dd8b_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1494_c2_9779_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1507_c7_7352_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1510_c7_9f11_iffalse := t8;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1494_c2_9779_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1507_c7_7352_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1510_c7_9f11_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1515_c7_b551_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1519_c7_4893_iffalse := tmp8_high;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1494_c2_9779_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1507_c7_7352_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1510_c7_9f11_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1515_c7_b551_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1519_c7_4893_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1525_c7_95b6_iffalse := tmp8_low;
     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1510_l1525_l1515_DUPLICATE_bd3e LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1510_l1525_l1515_DUPLICATE_bd3e_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1507_l1494_l1515_DUPLICATE_b2f0 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1507_l1494_l1515_DUPLICATE_b2f0_return_output := result.u16_value;

     -- sp_relative_shift[uxn_opcodes_h_l1512_c30_9585] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1512_c30_9585_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1512_c30_9585_ins;
     sp_relative_shift_uxn_opcodes_h_l1512_c30_9585_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1512_c30_9585_x;
     sp_relative_shift_uxn_opcodes_h_l1512_c30_9585_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1512_c30_9585_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1512_c30_9585_return_output := sp_relative_shift_uxn_opcodes_h_l1512_c30_9585_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1525_c11_b067] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1525_c11_b067_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1525_c11_b067_left;
     BIN_OP_EQ_uxn_opcodes_h_l1525_c11_b067_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1525_c11_b067_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1525_c11_b067_return_output := BIN_OP_EQ_uxn_opcodes_h_l1525_c11_b067_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1494_c6_0163] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1494_c6_0163_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1494_c6_0163_left;
     BIN_OP_EQ_uxn_opcodes_h_l1494_c6_0163_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1494_c6_0163_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1494_c6_0163_return_output := BIN_OP_EQ_uxn_opcodes_h_l1494_c6_0163_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1519_c11_433a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1519_c11_433a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1519_c11_433a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1519_c11_433a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1519_c11_433a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1519_c11_433a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1519_c11_433a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1507_c11_9e92] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1507_c11_9e92_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_9e92_left;
     BIN_OP_EQ_uxn_opcodes_h_l1507_c11_9e92_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_9e92_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_9e92_return_output := BIN_OP_EQ_uxn_opcodes_h_l1507_c11_9e92_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1507_l1525_l1519_l1515_l1510_DUPLICATE_778f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1507_l1525_l1519_l1515_l1510_DUPLICATE_778f_return_output := result.is_opc_done;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1494_c2_9779] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1494_c2_9779_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1510_c11_b9c4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1510_c11_b9c4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1510_c11_b9c4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1510_c11_b9c4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1510_c11_b9c4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1510_c11_b9c4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1510_c11_b9c4_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1517_c33_dd8b] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1517_c33_dd8b_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1517_c33_dd8b_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1517_c33_dd8b_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1517_c33_dd8b_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1517_c33_dd8b_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1517_c33_dd8b_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1513_c22_907f] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1513_c22_907f_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1494_c2_9779] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1494_c2_9779_return_output := result.is_pc_updated;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1494_c2_9779] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1494_c2_9779_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1507_l1519_l1510_l1515_DUPLICATE_6235 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1507_l1519_l1510_l1515_DUPLICATE_6235_return_output := result.is_stack_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1507_l1515_DUPLICATE_7024 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1507_l1515_DUPLICATE_7024_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1507_l1494_l1525_l1515_l1510_DUPLICATE_dc10 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1507_l1494_l1525_l1515_l1510_DUPLICATE_dc10_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1515_c11_2b60] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1515_c11_2b60_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1515_c11_2b60_left;
     BIN_OP_EQ_uxn_opcodes_h_l1515_c11_2b60_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1515_c11_2b60_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1515_c11_2b60_return_output := BIN_OP_EQ_uxn_opcodes_h_l1515_c11_2b60_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1494_c2_9779] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1494_c2_9779_return_output := result.is_stack_index_flipped;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1494_c2_9779_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1494_c6_0163_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1494_c2_9779_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1494_c6_0163_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1494_c2_9779_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1494_c6_0163_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1494_c2_9779_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1494_c6_0163_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1494_c2_9779_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1494_c6_0163_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1494_c2_9779_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1494_c6_0163_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1494_c2_9779_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1494_c6_0163_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1494_c2_9779_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1494_c6_0163_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1494_c2_9779_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1494_c6_0163_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1494_c2_9779_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1494_c6_0163_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1494_c2_9779_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1494_c6_0163_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1494_c2_9779_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1494_c6_0163_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1494_c2_9779_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1494_c6_0163_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_7352_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_9e92_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1507_c7_7352_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_9e92_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_7352_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_9e92_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_7352_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_9e92_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1507_c7_7352_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_9e92_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_7352_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_9e92_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1507_c7_7352_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_9e92_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1507_c7_7352_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_9e92_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1507_c7_7352_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_9e92_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1510_c7_9f11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1510_c11_b9c4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1510_c7_9f11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1510_c11_b9c4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1510_c7_9f11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1510_c11_b9c4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1510_c7_9f11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1510_c11_b9c4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1510_c7_9f11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1510_c11_b9c4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1510_c7_9f11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1510_c11_b9c4_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1510_c7_9f11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1510_c11_b9c4_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1510_c7_9f11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1510_c11_b9c4_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1510_c7_9f11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1510_c11_b9c4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_b551_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1515_c11_2b60_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_b551_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1515_c11_2b60_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1515_c7_b551_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1515_c11_2b60_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1515_c7_b551_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1515_c11_2b60_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1515_c7_b551_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1515_c11_2b60_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1515_c7_b551_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1515_c11_2b60_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1515_c7_b551_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1515_c11_2b60_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1515_c7_b551_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1515_c11_2b60_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1519_c7_4893_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1519_c11_433a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1519_c7_4893_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1519_c11_433a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1519_c7_4893_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1519_c11_433a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1519_c7_4893_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1519_c11_433a_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1519_c7_4893_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1519_c11_433a_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1519_c7_4893_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1519_c11_433a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_95b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1525_c11_b067_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_95b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1525_c11_b067_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1525_c7_95b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1525_c11_b067_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1525_c7_95b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1525_c11_b067_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1510_c7_9f11_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1513_c22_907f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_7352_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1507_l1515_DUPLICATE_7024_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1515_c7_b551_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1507_l1515_DUPLICATE_7024_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1494_c2_9779_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1507_l1494_l1515_DUPLICATE_b2f0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1507_c7_7352_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1507_l1494_l1515_DUPLICATE_b2f0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1515_c7_b551_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1507_l1494_l1515_DUPLICATE_b2f0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_7352_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1507_l1525_l1519_l1515_l1510_DUPLICATE_778f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1510_c7_9f11_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1507_l1525_l1519_l1515_l1510_DUPLICATE_778f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_b551_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1507_l1525_l1519_l1515_l1510_DUPLICATE_778f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1519_c7_4893_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1507_l1525_l1519_l1515_l1510_DUPLICATE_778f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_95b6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1507_l1525_l1519_l1515_l1510_DUPLICATE_778f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1507_c7_7352_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1507_l1519_l1510_l1515_DUPLICATE_6235_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1510_c7_9f11_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1507_l1519_l1510_l1515_DUPLICATE_6235_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_b551_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1507_l1519_l1510_l1515_DUPLICATE_6235_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1519_c7_4893_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1507_l1519_l1510_l1515_DUPLICATE_6235_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1510_c7_9f11_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1510_l1525_l1515_DUPLICATE_bd3e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1515_c7_b551_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1510_l1525_l1515_DUPLICATE_bd3e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_95b6_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1510_l1525_l1515_DUPLICATE_bd3e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1494_c2_9779_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1507_l1494_l1525_l1515_l1510_DUPLICATE_dc10_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_7352_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1507_l1494_l1525_l1515_l1510_DUPLICATE_dc10_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1510_c7_9f11_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1507_l1494_l1525_l1515_l1510_DUPLICATE_dc10_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1515_c7_b551_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1507_l1494_l1525_l1515_l1510_DUPLICATE_dc10_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1525_c7_95b6_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1507_l1494_l1525_l1515_l1510_DUPLICATE_dc10_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1494_c2_9779_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1494_c2_9779_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1494_c2_9779_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1494_c2_9779_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1494_c2_9779_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1494_c2_9779_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1494_c2_9779_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1494_c2_9779_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1510_c7_9f11_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1512_c30_9585_return_output;
     -- t8_MUX[uxn_opcodes_h_l1510_c7_9f11] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1510_c7_9f11_cond <= VAR_t8_MUX_uxn_opcodes_h_l1510_c7_9f11_cond;
     t8_MUX_uxn_opcodes_h_l1510_c7_9f11_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1510_c7_9f11_iftrue;
     t8_MUX_uxn_opcodes_h_l1510_c7_9f11_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1510_c7_9f11_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1510_c7_9f11_return_output := t8_MUX_uxn_opcodes_h_l1510_c7_9f11_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1494_c2_9779] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1494_c2_9779_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1494_c2_9779_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1494_c2_9779_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1494_c2_9779_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1494_c2_9779_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1494_c2_9779_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1494_c2_9779_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1494_c2_9779_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1494_c2_9779] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1494_c2_9779_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1494_c2_9779_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1494_c2_9779_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1494_c2_9779_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1494_c2_9779_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1494_c2_9779_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1494_c2_9779_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1494_c2_9779_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1517_c22_5abc] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1517_c22_5abc_return_output := CAST_TO_uint16_t_uint9_t(
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1517_c33_dd8b_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1519_c7_4893] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1519_c7_4893_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1519_c7_4893_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1519_c7_4893_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1519_c7_4893_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1519_c7_4893_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1519_c7_4893_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1519_c7_4893_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1519_c7_4893_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1525_c7_95b6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1525_c7_95b6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1525_c7_95b6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1525_c7_95b6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1525_c7_95b6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1525_c7_95b6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1525_c7_95b6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1525_c7_95b6_return_output := result_u8_value_MUX_uxn_opcodes_h_l1525_c7_95b6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1525_c7_95b6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_95b6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_95b6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_95b6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_95b6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_95b6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_95b6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_95b6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_95b6_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1494_c2_9779] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1494_c2_9779_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1494_c2_9779_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1494_c2_9779_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1494_c2_9779_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1494_c2_9779_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1494_c2_9779_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1494_c2_9779_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1494_c2_9779_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1519_c7_4893] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1519_c7_4893_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1519_c7_4893_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1519_c7_4893_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1519_c7_4893_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1519_c7_4893_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1519_c7_4893_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1519_c7_4893_return_output := tmp8_high_MUX_uxn_opcodes_h_l1519_c7_4893_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1525_c7_95b6] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1525_c7_95b6_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1525_c7_95b6_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1525_c7_95b6_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1525_c7_95b6_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1525_c7_95b6_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1525_c7_95b6_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1525_c7_95b6_return_output := tmp8_low_MUX_uxn_opcodes_h_l1525_c7_95b6_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1494_c2_9779] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1494_c2_9779_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1494_c2_9779_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1494_c2_9779_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1494_c2_9779_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1494_c2_9779_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1494_c2_9779_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1494_c2_9779_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1494_c2_9779_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1525_c7_95b6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_95b6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_95b6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_95b6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_95b6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_95b6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_95b6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_95b6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_95b6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1515_c7_b551] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1515_c7_b551_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1515_c7_b551_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1515_c7_b551_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1515_c7_b551_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1515_c7_b551_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1515_c7_b551_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1515_c7_b551_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1515_c7_b551_return_output;

     -- Submodule level 2
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1515_c7_b551_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1517_c22_5abc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1519_c7_4893_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_95b6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_b551_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1519_c7_4893_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1510_c7_9f11_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1515_c7_b551_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1519_c7_4893_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_95b6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1519_c7_4893_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1525_c7_95b6_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1507_c7_7352_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1510_c7_9f11_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1515_c7_b551_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1519_c7_4893_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1519_c7_4893_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1525_c7_95b6_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1515_c7_b551] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1515_c7_b551_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1515_c7_b551_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1515_c7_b551_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1515_c7_b551_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1515_c7_b551_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1515_c7_b551_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1515_c7_b551_return_output := result_u16_value_MUX_uxn_opcodes_h_l1515_c7_b551_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1519_c7_4893] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1519_c7_4893_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1519_c7_4893_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1519_c7_4893_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1519_c7_4893_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1519_c7_4893_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1519_c7_4893_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1519_c7_4893_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1519_c7_4893_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1515_c7_b551] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1515_c7_b551_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1515_c7_b551_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1515_c7_b551_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1515_c7_b551_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1515_c7_b551_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1515_c7_b551_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1515_c7_b551_return_output := tmp8_high_MUX_uxn_opcodes_h_l1515_c7_b551_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1519_c7_4893] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1519_c7_4893_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1519_c7_4893_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1519_c7_4893_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1519_c7_4893_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1519_c7_4893_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1519_c7_4893_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1519_c7_4893_return_output := tmp8_low_MUX_uxn_opcodes_h_l1519_c7_4893_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1519_c7_4893] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1519_c7_4893_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1519_c7_4893_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1519_c7_4893_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1519_c7_4893_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1519_c7_4893_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1519_c7_4893_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1519_c7_4893_return_output := result_u8_value_MUX_uxn_opcodes_h_l1519_c7_4893_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1515_c7_b551] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_b551_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_b551_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_b551_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_b551_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_b551_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_b551_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_b551_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_b551_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1519_c7_4893] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1519_c7_4893_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1519_c7_4893_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1519_c7_4893_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1519_c7_4893_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1519_c7_4893_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1519_c7_4893_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1519_c7_4893_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1519_c7_4893_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1510_c7_9f11] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1510_c7_9f11_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1510_c7_9f11_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1510_c7_9f11_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1510_c7_9f11_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1510_c7_9f11_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1510_c7_9f11_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1510_c7_9f11_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1510_c7_9f11_return_output;

     -- t8_MUX[uxn_opcodes_h_l1507_c7_7352] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1507_c7_7352_cond <= VAR_t8_MUX_uxn_opcodes_h_l1507_c7_7352_cond;
     t8_MUX_uxn_opcodes_h_l1507_c7_7352_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1507_c7_7352_iftrue;
     t8_MUX_uxn_opcodes_h_l1507_c7_7352_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1507_c7_7352_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1507_c7_7352_return_output := t8_MUX_uxn_opcodes_h_l1507_c7_7352_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_b551_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1519_c7_4893_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1510_c7_9f11_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_b551_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_7352_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1510_c7_9f11_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1515_c7_b551_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1519_c7_4893_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1510_c7_9f11_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1515_c7_b551_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1515_c7_b551_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1519_c7_4893_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1494_c2_9779_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1507_c7_7352_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1510_c7_9f11_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1515_c7_b551_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1515_c7_b551_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1519_c7_4893_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1510_c7_9f11] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1510_c7_9f11_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1510_c7_9f11_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1510_c7_9f11_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1510_c7_9f11_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1510_c7_9f11_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1510_c7_9f11_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1510_c7_9f11_return_output := result_u16_value_MUX_uxn_opcodes_h_l1510_c7_9f11_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1515_c7_b551] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1515_c7_b551_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1515_c7_b551_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1515_c7_b551_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1515_c7_b551_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1515_c7_b551_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1515_c7_b551_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1515_c7_b551_return_output := result_u8_value_MUX_uxn_opcodes_h_l1515_c7_b551_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1510_c7_9f11] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1510_c7_9f11_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1510_c7_9f11_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1510_c7_9f11_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1510_c7_9f11_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1510_c7_9f11_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1510_c7_9f11_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1510_c7_9f11_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1510_c7_9f11_return_output;

     -- t8_MUX[uxn_opcodes_h_l1494_c2_9779] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1494_c2_9779_cond <= VAR_t8_MUX_uxn_opcodes_h_l1494_c2_9779_cond;
     t8_MUX_uxn_opcodes_h_l1494_c2_9779_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1494_c2_9779_iftrue;
     t8_MUX_uxn_opcodes_h_l1494_c2_9779_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1494_c2_9779_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1494_c2_9779_return_output := t8_MUX_uxn_opcodes_h_l1494_c2_9779_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1515_c7_b551] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1515_c7_b551_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1515_c7_b551_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1515_c7_b551_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1515_c7_b551_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1515_c7_b551_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1515_c7_b551_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1515_c7_b551_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1515_c7_b551_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1510_c7_9f11] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1510_c7_9f11_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1510_c7_9f11_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1510_c7_9f11_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1510_c7_9f11_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1510_c7_9f11_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1510_c7_9f11_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1510_c7_9f11_return_output := tmp8_high_MUX_uxn_opcodes_h_l1510_c7_9f11_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1515_c7_b551] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_b551_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_b551_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_b551_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_b551_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_b551_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_b551_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_b551_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_b551_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1515_c7_b551] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1515_c7_b551_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1515_c7_b551_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1515_c7_b551_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1515_c7_b551_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1515_c7_b551_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1515_c7_b551_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1515_c7_b551_return_output := tmp8_low_MUX_uxn_opcodes_h_l1515_c7_b551_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1507_c7_7352] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_7352_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_7352_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_7352_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_7352_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_7352_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_7352_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_7352_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_7352_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1510_c7_9f11_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_b551_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1507_c7_7352_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1510_c7_9f11_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1494_c2_9779_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_7352_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1510_c7_9f11_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1515_c7_b551_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1507_c7_7352_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1510_c7_9f11_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1510_c7_9f11_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1515_c7_b551_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1494_c2_9779_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1507_c7_7352_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1510_c7_9f11_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1510_c7_9f11_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1515_c7_b551_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1510_c7_9f11] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1510_c7_9f11_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1510_c7_9f11_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1510_c7_9f11_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1510_c7_9f11_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1510_c7_9f11_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1510_c7_9f11_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1510_c7_9f11_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1510_c7_9f11_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1510_c7_9f11] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1510_c7_9f11_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1510_c7_9f11_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1510_c7_9f11_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1510_c7_9f11_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1510_c7_9f11_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1510_c7_9f11_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1510_c7_9f11_return_output := tmp8_low_MUX_uxn_opcodes_h_l1510_c7_9f11_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1507_c7_7352] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1507_c7_7352_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1507_c7_7352_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1507_c7_7352_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1507_c7_7352_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1507_c7_7352_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1507_c7_7352_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1507_c7_7352_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1507_c7_7352_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1510_c7_9f11] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1510_c7_9f11_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1510_c7_9f11_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1510_c7_9f11_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1510_c7_9f11_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1510_c7_9f11_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1510_c7_9f11_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1510_c7_9f11_return_output := result_u8_value_MUX_uxn_opcodes_h_l1510_c7_9f11_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1507_c7_7352] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1507_c7_7352_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1507_c7_7352_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1507_c7_7352_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1507_c7_7352_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1507_c7_7352_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1507_c7_7352_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1507_c7_7352_return_output := result_u16_value_MUX_uxn_opcodes_h_l1507_c7_7352_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1494_c2_9779] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1494_c2_9779_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1494_c2_9779_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1494_c2_9779_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1494_c2_9779_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1494_c2_9779_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1494_c2_9779_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1494_c2_9779_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1494_c2_9779_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1510_c7_9f11] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1510_c7_9f11_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1510_c7_9f11_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1510_c7_9f11_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1510_c7_9f11_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1510_c7_9f11_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1510_c7_9f11_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1510_c7_9f11_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1510_c7_9f11_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1507_c7_7352] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1507_c7_7352_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1507_c7_7352_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1507_c7_7352_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1507_c7_7352_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1507_c7_7352_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1507_c7_7352_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1507_c7_7352_return_output := tmp8_high_MUX_uxn_opcodes_h_l1507_c7_7352_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_7352_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1510_c7_9f11_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1494_c2_9779_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1507_c7_7352_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_7352_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1510_c7_9f11_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1494_c2_9779_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1507_c7_7352_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_7352_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1510_c7_9f11_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1494_c2_9779_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1507_c7_7352_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1507_c7_7352_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1510_c7_9f11_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1494_c2_9779] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1494_c2_9779_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1494_c2_9779_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1494_c2_9779_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1494_c2_9779_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1494_c2_9779_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1494_c2_9779_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1494_c2_9779_return_output := result_u16_value_MUX_uxn_opcodes_h_l1494_c2_9779_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1494_c2_9779] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1494_c2_9779_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1494_c2_9779_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1494_c2_9779_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1494_c2_9779_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1494_c2_9779_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1494_c2_9779_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1494_c2_9779_return_output := tmp8_high_MUX_uxn_opcodes_h_l1494_c2_9779_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1507_c7_7352] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1507_c7_7352_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1507_c7_7352_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1507_c7_7352_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1507_c7_7352_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1507_c7_7352_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1507_c7_7352_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1507_c7_7352_return_output := tmp8_low_MUX_uxn_opcodes_h_l1507_c7_7352_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1507_c7_7352] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1507_c7_7352_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_7352_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1507_c7_7352_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_7352_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1507_c7_7352_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_7352_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_7352_return_output := result_u8_value_MUX_uxn_opcodes_h_l1507_c7_7352_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1507_c7_7352] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_7352_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_7352_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_7352_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_7352_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_7352_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_7352_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_7352_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_7352_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1507_c7_7352] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_7352_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_7352_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_7352_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_7352_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_7352_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_7352_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_7352_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_7352_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1494_c2_9779] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1494_c2_9779_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1494_c2_9779_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1494_c2_9779_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1494_c2_9779_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1494_c2_9779_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1494_c2_9779_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1494_c2_9779_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1494_c2_9779_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1494_c2_9779_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_7352_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1494_c2_9779_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_7352_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1494_c2_9779_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_7352_return_output;
     REG_VAR_tmp8_high := VAR_tmp8_high_MUX_uxn_opcodes_h_l1494_c2_9779_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1494_c2_9779_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1507_c7_7352_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1494_c2_9779] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1494_c2_9779_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1494_c2_9779_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1494_c2_9779_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1494_c2_9779_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1494_c2_9779_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1494_c2_9779_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1494_c2_9779_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1494_c2_9779_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1494_c2_9779] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1494_c2_9779_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1494_c2_9779_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1494_c2_9779_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1494_c2_9779_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1494_c2_9779_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1494_c2_9779_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1494_c2_9779_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1494_c2_9779_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1494_c2_9779] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1494_c2_9779_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1494_c2_9779_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1494_c2_9779_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1494_c2_9779_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1494_c2_9779_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1494_c2_9779_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1494_c2_9779_return_output := result_u8_value_MUX_uxn_opcodes_h_l1494_c2_9779_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1494_c2_9779] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1494_c2_9779_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1494_c2_9779_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1494_c2_9779_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1494_c2_9779_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1494_c2_9779_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1494_c2_9779_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1494_c2_9779_return_output := tmp8_low_MUX_uxn_opcodes_h_l1494_c2_9779_return_output;

     -- Submodule level 7
     REG_VAR_tmp8_low := VAR_tmp8_low_MUX_uxn_opcodes_h_l1494_c2_9779_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_9f32_uxn_opcodes_h_l1490_l1532_DUPLICATE_377e LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9f32_uxn_opcodes_h_l1490_l1532_DUPLICATE_377e_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_9f32(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1494_c2_9779_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1494_c2_9779_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1494_c2_9779_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1494_c2_9779_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1494_c2_9779_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1494_c2_9779_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1494_c2_9779_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1494_c2_9779_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1494_c2_9779_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1494_c2_9779_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9f32_uxn_opcodes_h_l1490_l1532_DUPLICATE_377e_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9f32_uxn_opcodes_h_l1490_l1532_DUPLICATE_377e_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_tmp8_high <= REG_VAR_tmp8_high;
REG_COMB_tmp8_low <= REG_VAR_tmp8_low;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     tmp8_high <= REG_COMB_tmp8_high;
     tmp8_low <= REG_COMB_tmp8_low;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
